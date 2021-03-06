// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "third_party/blink/renderer/core/css/vision_deficiency.h"
#include "third_party/blink/renderer/platform/wtf/text/wtf_string.h"

namespace blink {

AtomicString CreateFilterDataUrl(AtomicString piece) {
  // clang-format off
  AtomicString url =
      "data:image/svg+xml,"
        "<svg xmlns=\"http://www.w3.org/2000/svg\">"
          "<filter id=\"f\">" +
            piece +
          "</filter>"
        "</svg>"
      "#f";
  // clang-format on
  return url;
}

AtomicString CreateVisionDeficiencyFilterUrl(
    VisionDeficiency vision_deficiency) {
  // The filter color matrices are based on the following research paper:
  // Gustavo M. Machado, Manuel M. Oliveira, and Leandro A. F. Fernandes
  // "A Physiologically-based Model for Simulation of Color Vision Deficiency".
  // IEEE Transactions on Visualization and Computer Graphics. Volume 15 (2009),
  // Number 6, November/December 2009. pp. 1291-1298.
  // https://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html
  switch (vision_deficiency) {
    case VisionDeficiency::kAchromatopsia:
      return CreateFilterDataUrl(
          "<feColorMatrix values=\""
          "0.299  0.587  0.114  0.000  0.000 "
          "0.299  0.587  0.114  0.000  0.000 "
          "0.299  0.587  0.114  0.000  0.000 "
          "0.000  0.000  0.000  1.000  0.000 "
          "\"/>");
    case VisionDeficiency::kBlurredVision:
      return CreateFilterDataUrl("<feGaussianBlur stdDeviation=\"2\"/>");
    case VisionDeficiency::kDeuteranopia:
      return CreateFilterDataUrl(
          "<feColorMatrix values=\""
          " 0.367  0.861 -0.228  0.000  0.000 "
          " 0.280  0.673  0.047  0.000  0.000 "
          "-0.012  0.043  0.969  0.000  0.000 "
          " 0.000  0.000  0.000  1.000  0.000 "
          "\"/>");
    case VisionDeficiency::kProtanopia:
      return CreateFilterDataUrl(
          "<feColorMatrix values=\""
          " 0.152  1.053 -0.205  0.000  0.000 "
          " 0.115  0.786  0.099  0.000  0.000 "
          "-0.004 -0.048  1.052  0.000  0.000 "
          " 0.000  0.000  0.000  1.000  0.000 "
          "\"/>");
    case VisionDeficiency::kTritanopia:
      return CreateFilterDataUrl(
          "<feColorMatrix values=\""
          " 1.256 -0.077 -0.179  0.000  0.000 "
          "-0.078  0.931  0.148  0.000  0.000 "
          " 0.005  0.691  0.304  0.000  0.000 "
          " 0.000  0.000  0.000  1.000  0.000 "
          "\"/>");
    case VisionDeficiency::kNoVisionDeficiency:
      NOTREACHED();
      return "";
  }
}

}  // namespace blink
