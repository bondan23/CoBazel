load(
  "//Vendor/rules_pods/BazelExtensions:extensions.bzl",
  "pch_with_name_hint",
  "acknowledged_target",
  "gen_module_map",
  "gen_includes"
  )
# Add a config setting release for compilation mode
# Assume that people are using `opt` for release mode
# see the bazel user manual for more information
# https://bazel.build/versions/master/docs/bazel-user-manual.html
native.config_setting(
  name = "release",
  values = {
    "compilation_mode": "opt"
  }
  )
filegroup(
  name = "Tweaks_hdrs",
  srcs = glob(
    [
      "pod_support/Headers/Public/**/*"
    ],
    exclude_directories = 1
    ) + glob(
    [
      "FBTweak/*.h"
    ],
    exclude_directories = 1
    ) + [

  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Tweaks_includes",
  include = [
    "Vendor/Tweaks/pod_support/Headers/Public/"
  ]
  )
gen_module_map(
  "Tweaks",
  "Tweaks_module_map",
  "Tweaks",
  [
    "Tweaks_hdrs"
  ]
  )
objc_library(
  name = "Tweaks",
  enable_modules = 1,
  srcs = glob(
    [
      "FBTweak/*.m"
    ],
    exclude_directories = 1
    ),
  hdrs = [
    ":Tweaks_hdrs",
    ":Tweaks_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "Tweaks",
    [
      "FBTweak/**/*.pch"
    ]
    ),
  includes = [
    "Tweaks_module_map"
  ],
  sdk_frameworks = [
    "MessageUI"
  ],
  deps = [

  ] + [
    ":Tweaks_includes"
  ],
  copts = [
    "-Wno-everything",
    "-Wnon-modular-include-in-framework-module",
    "-g",
    "-stdlib=libc++",
    "-DCOCOAPODS=1",
    "-DOBJC_OLD_DISPATCH_PROTOTYPES=0",
    "-fdiagnostics-show-note-include-stack",
    "-fno-common",
    "-fembed-bitcode-marker",
    "-fmessage-length=0",
    "-fpascal-strings",
    "-fstrict-aliasing",
    "-Wno-error=nonportable-include-path"
  ] + select(
    {
      "//conditions:default": [
        "-DPOD_CONFIGURATION_RELEASE=0"
      ],
      ":release": [
        "-DPOD_CONFIGURATION_RELEASE=1",
        "-DNS_BLOCK_ASSERTIONS=1"
      ]
    }
    ) + [
    "-IVendor/Tweaks/pod_support/Headers/Public/Tweaks/"
  ] + [
    "-fmodule-name=Tweaks_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Tweaks_acknowledgement",
  deps = [

  ],
  value = "//Vendor/Tweaks/pod_support_buildable:acknowledgement_fragment"
  )