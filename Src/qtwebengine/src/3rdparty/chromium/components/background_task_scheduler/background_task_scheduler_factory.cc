// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "components/background_task_scheduler/background_task_scheduler_factory.h"

#include <memory>

#include "base/memory/singleton.h"
#include "components/background_task_scheduler/internal/android/native_task_scheduler.h"
#include "components/keyed_service/core/simple_dependency_manager.h"

namespace background_task {

// static
BackgroundTaskSchedulerFactory* BackgroundTaskSchedulerFactory::GetInstance() {
  return base::Singleton<BackgroundTaskSchedulerFactory>::get();
}

// static
BackgroundTaskScheduler* BackgroundTaskSchedulerFactory::GetForKey(
    SimpleFactoryKey* key) {
  return static_cast<BackgroundTaskScheduler*>(
      GetInstance()->GetServiceForKey(key, true));
}

BackgroundTaskSchedulerFactory::BackgroundTaskSchedulerFactory()
    : SimpleKeyedServiceFactory("BackgroundTaskScheduler",
                                SimpleDependencyManager::GetInstance()) {}

BackgroundTaskSchedulerFactory::~BackgroundTaskSchedulerFactory() = default;

std::unique_ptr<KeyedService>
BackgroundTaskSchedulerFactory::BuildServiceInstanceFor(
    SimpleFactoryKey* key) const {
  return std::make_unique<NativeTaskScheduler>();
}

SimpleFactoryKey* BackgroundTaskSchedulerFactory::GetKeyToUse(
    SimpleFactoryKey* key) const {
  return key;
}

}  // namespace background_task
