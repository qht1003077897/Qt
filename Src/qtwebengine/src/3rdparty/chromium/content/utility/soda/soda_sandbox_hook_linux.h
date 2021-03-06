// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CONTENT_UTILITY_SODA_SODA_SANDBOX_HOOK_LINUX_H_
#define CONTENT_UTILITY_SODA_SODA_SANDBOX_HOOK_LINUX_H_

#include "services/service_manager/sandbox/linux/sandbox_linux.h"

namespace soda {

// Opens the libsoda.so binary and grants broker file permissions to the
// necessary files required by the binary.
bool SodaPreSandboxHook(service_manager::SandboxLinux::Options options);

}  // namespace soda

#endif  // CONTENT_UTILITY_SODA_SODA_SANDBOX_HOOK_LINUX_H_
