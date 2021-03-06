/*
 * Copyright 2006 The Android Open Source Project
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#include "src/core/SkScalerCache.h"

#include "include/core/SkGraphics.h"
#include "include/core/SkPath.h"
#include "include/core/SkTypeface.h"
#include "src/core/SkEnumerate.h"
#include "src/core/SkScalerContext.h"

static SkFontMetrics use_or_generate_metrics(
        const SkFontMetrics* metrics, SkScalerContext* context) {
    SkFontMetrics answer;
    if (metrics) {
        answer = *metrics;
    } else {
        context->getFontMetrics(&answer);
    }
    return answer;
}

SkScalerCache::SkScalerCache(
    const SkDescriptor& desc,
    std::unique_ptr<SkScalerContext> scaler,
    const SkFontMetrics* fontMetrics)
        : fDesc{desc}
        , fScalerContext{std::move(scaler)}
        , fFontMetrics{use_or_generate_metrics(fontMetrics, fScalerContext.get())}
        , fRoundingSpec{fScalerContext->isSubpixel(),
                        fScalerContext->computeAxisAlignmentForHText()} {
    SkASSERT(fScalerContext != nullptr);
}

// -- glyph creation -------------------------------------------------------------------------------
std::tuple<SkGlyph*, size_t> SkScalerCache::makeGlyph(SkPackedGlyphID packedGlyphID) {
    SkGlyph* glyph = fAlloc.make<SkGlyph>(packedGlyphID);
    fGlyphMap.set(glyph);
    return std::make_tuple(glyph, sizeof(SkGlyph));
}

std::tuple<SkGlyph*, size_t> SkScalerCache::glyph(SkPackedGlyphID packedGlyphID) {
    SkGlyph* glyph = fGlyphMap.findOrNull(packedGlyphID);
    size_t bytes = 0;
    if (glyph == nullptr) {
        std::tie(glyph, bytes) = this->makeGlyph(packedGlyphID);
        fScalerContext->getMetrics(glyph);
    }
    return std::make_tuple(glyph, bytes);
}

std::tuple<const SkPath*, size_t> SkScalerCache::preparePath(SkGlyph* glyph) {
    size_t delta = 0;
    if (glyph->setPath(&fAlloc, fScalerContext.get())) {
        delta = glyph->path()->approximateBytesUsed();
    }
    return std::make_tuple(glyph->path(), delta);
}

std::tuple<const SkPath*, size_t> SkScalerCache::mergePath(SkGlyph* glyph, const SkPath* path) {
    SkAutoMutexExclusive lock{fMu};
    size_t pathDelta = 0;
    if (glyph->setPath(&fAlloc, path)) {
        pathDelta = glyph->path()->approximateBytesUsed();
    }
    return std::make_tuple(glyph->path(), pathDelta);
}

const SkDescriptor& SkScalerCache::getDescriptor() const {
    return *fDesc.getDesc();
}

int SkScalerCache::countCachedGlyphs() const {
    SkAutoMutexExclusive lock(fMu);
    return fGlyphMap.count();
}

std::tuple<SkSpan<const SkGlyph*>, size_t> SkScalerCache::internalPrepare(
        SkSpan<const SkGlyphID> glyphIDs, PathDetail pathDetail, const SkGlyph** results) {
    const SkGlyph** cursor = results;
    size_t delta = 0;
    for (auto glyphID : glyphIDs) {
        auto t = this->glyph(SkPackedGlyphID{glyphID});
        auto glyph = std::get<0>(t);
        auto size = std::get<1>(t);
        delta += size;
        if (pathDetail == kMetricsAndPath) {
            auto pathSize = std::get<1>(this->preparePath(glyph));
            delta += pathSize;
        }
        *cursor++ = glyph;
    }

    return std::make_tuple(SkSpan<const SkGlyph*>{results, glyphIDs.size()}, delta);
}

std::tuple<const void*, size_t> SkScalerCache::prepareImage(SkGlyph* glyph) {
    size_t delta = 0;
    if (glyph->setImage(&fAlloc, fScalerContext.get())) {
        delta = glyph->imageSize();
    }
    return std::make_tuple(glyph->image(), delta);
}

std::tuple<SkGlyph*, size_t> SkScalerCache::mergeGlyphAndImage(
        SkPackedGlyphID toID, const SkGlyph& from) {
    SkAutoMutexExclusive lock{fMu};
    size_t delta = 0;
    size_t imageDelta = 0;
    SkGlyph* glyph = fGlyphMap.findOrNull(toID);
    if (glyph == nullptr) {
        auto t = this->makeGlyph(toID);
        glyph = std::get<0>(t);
        delta = std::get<1>(t);
    }
    if (glyph->setMetricsAndImage(&fAlloc, from)) {
        imageDelta= glyph->imageSize();
    }
    return std::make_tuple(glyph, delta + imageDelta);
}

std::tuple<SkSpan<const SkGlyph*>, size_t> SkScalerCache::metrics(
        SkSpan<const SkGlyphID> glyphIDs, const SkGlyph* results[]) {
    SkAutoMutexExclusive lock{fMu};
    auto t = this->internalPrepare(glyphIDs, kMetricsOnly, results);
    auto glyphs = std::get<0>(t);
    auto delta = std::get<1>(t);
    return std::make_tuple(glyphs, delta);
}

std::tuple<SkSpan<const SkGlyph*>, size_t> SkScalerCache::preparePaths(
        SkSpan<const SkGlyphID> glyphIDs, const SkGlyph* results[]) {
    SkAutoMutexExclusive lock{fMu};
    auto t = this->internalPrepare(glyphIDs, kMetricsAndPath, results);
    auto glyphs = std::get<0>(t);
    auto delta = std::get<1>(t);
    return std::make_tuple(glyphs, delta);
}

std::tuple<SkSpan<const SkGlyph*>, size_t> SkScalerCache::prepareImages(
        SkSpan<const SkPackedGlyphID> glyphIDs, const SkGlyph* results[]) {
    const SkGlyph** cursor = results;
    SkAutoMutexExclusive lock{fMu};
    size_t delta = 0;
    for (auto glyphID : glyphIDs) {
        auto t = this->glyph(glyphID);
        auto glyph = std::get<0>(t);
        auto glyphSize = std::get<1>(t);
        auto imageSize = std::get<1>(this->prepareImage(glyph));
        delta += glyphSize + imageSize;
        *cursor++ = glyph;
    }

    return std::make_tuple(SkSpan<const SkGlyph*>{results, glyphIDs.size()}, delta);
}

template <typename Fn>
size_t SkScalerCache::commonFilterLoop(SkDrawableGlyphBuffer* drawables, Fn&& fn) {
    size_t total = 0;
    for (auto t : SkMakeEnumerate(drawables->input())) {
        auto i = std::get<0>(t);
        auto packedID = std::get<0>(std::get<1>(t));
        auto pos = std::get<1>(std::get<1>(t));
        if (SkScalarsAreFinite(pos.x(), pos.y())) {
            auto t = this->glyph(packedID);
            auto glyph = std::get<0>(t);
            auto size = std::get<1>(t);
            total += size;
            if (!glyph->isEmpty()) {
                fn(i, glyph, pos);
            }
        }
    }
    return total;
}

size_t SkScalerCache::prepareForDrawingMasksCPU(SkDrawableGlyphBuffer* drawables) {
    SkAutoMutexExclusive lock{fMu};
    size_t imageDelta = 0;
    size_t delta = this->commonFilterLoop(drawables,
        [&](size_t i, SkGlyph* glyph, SkPoint pos) SK_REQUIRES(fMu) {
            // If the glyph is too large, then no image is created.
            auto t = this->prepareImage(glyph);
            auto image = std::get<0>(t);
            auto imageSize = std::get<1>(t);
            if (image != nullptr) {
                drawables->push_back(glyph, i);
                imageDelta += imageSize;
            }
        });

    return delta + imageDelta;
}

// Note: this does not actually fill out the image. That happens at atlas building time.
size_t SkScalerCache::prepareForMaskDrawing(
        SkDrawableGlyphBuffer* drawables, SkSourceGlyphBuffer* rejects) {
    SkAutoMutexExclusive lock{fMu};
    size_t delta = this->commonFilterLoop(drawables,
        [&](size_t i, SkGlyph* glyph, SkPoint pos) {
            if (SkStrikeForGPU::CanDrawAsMask(*glyph)) {
                drawables->push_back(glyph, i);
            } else {
                rejects->reject(i);
            }
        });

    return delta;
}

size_t SkScalerCache::prepareForSDFTDrawing(
        SkDrawableGlyphBuffer* drawables, SkSourceGlyphBuffer* rejects) {
    SkAutoMutexExclusive lock{fMu};
    size_t delta = this->commonFilterLoop(drawables,
        [&](size_t i, SkGlyph* glyph, SkPoint pos) {
            if (SkStrikeForGPU::CanDrawAsSDFT(*glyph)) {
                drawables->push_back(glyph, i);
            } else {
                rejects->reject(i);
            }
        });

    return delta;
}

size_t SkScalerCache::prepareForPathDrawing(
        SkDrawableGlyphBuffer* drawables, SkSourceGlyphBuffer* rejects) {
    SkAutoMutexExclusive lock{fMu};
    size_t pathDelta = 0;
    size_t delta = this->commonFilterLoop(drawables,
        [&](size_t i, SkGlyph* glyph, SkPoint pos) SK_REQUIRES(fMu) {
            if (!glyph->isColor()) {
                auto t = this->preparePath(glyph);
                auto path = std::get<0>(t);
                auto pathSize = std::get<1>(t);
                pathDelta += pathSize;
                if (path != nullptr) {
                    // Save off the path to draw later.
                    drawables->push_back(path, i);
                } else {
                    // Glyph does not have a path. It is probably bitmap only.
                    rejects->reject(i, glyph->maxDimension());
                }
            } else {
                // Glyph is color.
                rejects->reject(i, glyph->maxDimension());
            }
        });

    return delta + pathDelta;
}

void SkScalerCache::findIntercepts(const SkScalar bounds[2], SkScalar scale, SkScalar xPos,
        SkGlyph* glyph, SkScalar* array, int* count) {
    SkAutoMutexExclusive lock{fMu};
    glyph->ensureIntercepts(bounds, scale, xPos, array, count, &fAlloc);
}

void SkScalerCache::dump() const {
    SkAutoMutexExclusive lock{fMu};
    const SkTypeface* face = fScalerContext->getTypeface();
    const SkScalerContextRec& rec = fScalerContext->getRec();
    SkMatrix matrix;
    rec.getSingleMatrix(&matrix);
    matrix.preScale(SkScalarInvert(rec.fTextSize), SkScalarInvert(rec.fTextSize));
    SkString name;
    face->getFamilyName(&name);

    SkString msg;
    SkFontStyle style = face->fontStyle();
    msg.printf("cache typeface:%x %25s:(%d,%d,%d)\n %s glyphs:%3d",
               face->uniqueID(), name.c_str(), style.weight(), style.width(), style.slant(),
               rec.dump().c_str(), fGlyphMap.count());
    SkDebugf("%s\n", msg.c_str());
}

