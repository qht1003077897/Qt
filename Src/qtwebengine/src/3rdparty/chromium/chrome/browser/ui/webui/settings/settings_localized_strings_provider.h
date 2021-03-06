// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_BROWSER_UI_WEBUI_SETTINGS_SETTINGS_LOCALIZED_STRINGS_PROVIDER_H_
#define CHROME_BROWSER_UI_WEBUI_SETTINGS_SETTINGS_LOCALIZED_STRINGS_PROVIDER_H_

class Profile;

namespace content {
class WebUIDataSource;
class WebContents;
}

namespace settings {

// Adds the strings needed by the browser settings page to |html_source|
// This function causes |html_source| to expose a strings.js file from its
// source which contains a mapping from string's name to its translated value.
// TODO(crbug/967888): This still contains OS Settings strings. Strings specific
// to OS settings should be moved to os_settings_localized_strings_provider.cc.
void AddBrowserLocalizedStrings(content::WebUIDataSource* html_source,
                                Profile* profile,
                                content::WebContents* web_contents);

}  // namespace settings

#endif  // CHROME_BROWSER_UI_WEBUI_SETTINGS_SETTINGS_LOCALIZED_STRINGS_PROVIDER_H_
