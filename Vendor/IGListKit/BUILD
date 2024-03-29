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
config_setting(
  name = "iosCase",
  values = {
    "cpu": "powerpc1"
  }
  )
config_setting(
  name = "osxCase",
  values = {
    "cpu": "powerpc2"
  }
  )
config_setting(
  name = "tvosCase",
  values = {
    "cpu": "powerpc3"
  }
  )
filegroup(
  name = "IGListKit_hdrs",
  srcs = glob(
    [
      "pod_support/Headers/Public/**/*"
    ],
    exclude_directories = 1
    ) + [

  ] + [
    ":Default_hdrs"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "IGListKit_includes",
  include = [
    "Vendor/IGListKit/pod_support/Headers/Public/"
  ]
  )
gen_module_map(
  "IGListKit",
  "IGListKit_module_map",
  "IGListKit",
  [
    "IGListKit_hdrs"
  ]
  )
objc_library(
  name = "IGListKit",
  enable_modules = 1,
  hdrs = [
    ":IGListKit_hdrs",
    ":IGListKit_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "IGListKit",
    [

    ]
    ),
  includes = [
    "IGListKit_module_map"
  ],
  sdk_frameworks = select(
    {
      "//conditions:default": [
        "UIKit"
      ],
      ":osxCase": [
        "Cocoa"
      ],
      ":tvosCase": [
        "UIKit"
      ]
    }
    ),
  sdk_dylibs = [
    "c++"
  ],
  deps = [
    ":Default"
  ] + [
    ":IGListKit_includes"
  ],
  copts = [
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
    "-IVendor/IGListKit/pod_support/Headers/Public/IGListKit/"
  ] + [
    "-fmodule-name=IGListKit_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "IGListKit_acknowledgement",
  deps = [

  ],
  value = "//Vendor/IGListKit/pod_support_buildable:acknowledgement_fragment"
  )
filegroup(
  name = "Diffing_cxx_hdrs",
  srcs = glob(
    [
      "Source/Common/**/*.h",
      "Source/Common/Internal/*.h"
    ],
    exclude_directories = 1
    ),
  visibility = [
    "//visibility:public"
  ]
  )
filegroup(
  name = "Diffing_cxx_union_hdrs",
  srcs = [
    "Diffing_cxx_hdrs",
    "IGListKit_hdrs"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Diffing_cxx_includes",
  include = [
    "Vendor/IGListKit/pod_support/Headers/Public/"
  ]
  )
objc_library(
  name = "Diffing_cxx",
  enable_modules = 1,
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/Common/**/*.mm"
        ],
        exclude = [
          "Source/**/*.m",
          "Source/**/*.mm",
          "Source/Common/**/*.m"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/Common/**/*.mm"
        ],
        exclude = [
          "Source/**/*.m",
          "Source/**/*.mm",
          "Source/Common/**/*.m"
        ],
        exclude_directories = 1
        )
    }
    ),
  hdrs = [
    ":Diffing_cxx_union_hdrs",
    ":IGListKit_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "IGListKit",
    [
      "Source/**/*.pch"
    ]
    ),
  includes = [
    "IGListKit_module_map"
  ],
  sdk_frameworks = select(
    {
      "//conditions:default": [
        "UIKit"
      ],
      ":osxCase": [
        "Cocoa"
      ],
      ":tvosCase": [
        "UIKit"
      ]
    }
    ),
  sdk_dylibs = [
    "c++"
  ],
  deps = [

  ] + [
    ":Diffing_cxx_includes"
  ],
  copts = [
    "-std=c++11",
    "-stdlib=libc++",
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
    "-IVendor/IGListKit/pod_support/Headers/Public/IGListKit/"
  ] + [
    "-fmodule-name=IGListKit_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Diffing_cxx_acknowledgement",
  deps = [

  ],
  value = "//Vendor/IGListKit/pod_support_buildable:acknowledgement_fragment"
  )
filegroup(
  name = "Diffing_hdrs",
  srcs = glob(
    [
      "Source/Common/**/*.h",
      "Source/Common/Internal/*.h"
    ],
    exclude_directories = 1
    ),
  visibility = [
    "//visibility:public"
  ]
  )
filegroup(
  name = "Diffing_union_hdrs",
  srcs = [
    "Diffing_hdrs",
    "IGListKit_hdrs"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Diffing_includes",
  include = [
    "Vendor/IGListKit/pod_support/Headers/Public/"
  ]
  )
objc_library(
  name = "Diffing",
  enable_modules = 1,
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/Common/**/*.m"
        ],
        exclude = [
          "Source/**/*.m",
          "Source/**/*.mm"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/Common/**/*.m"
        ],
        exclude = [
          "Source/**/*.m",
          "Source/**/*.mm"
        ],
        exclude_directories = 1
        )
    }
    ),
  hdrs = [
    ":Diffing_union_hdrs",
    ":IGListKit_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "IGListKit",
    [
      "Source/**/*.pch"
    ]
    ),
  includes = [
    "IGListKit_module_map"
  ],
  sdk_frameworks = select(
    {
      "//conditions:default": [
        "UIKit"
      ],
      ":osxCase": [
        "Cocoa"
      ],
      ":tvosCase": [
        "UIKit"
      ]
    }
    ),
  sdk_dylibs = [
    "c++"
  ],
  deps = [
    ":Diffing_cxx"
  ] + [
    ":Diffing_includes"
  ],
  copts = [
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
    "-IVendor/IGListKit/pod_support/Headers/Public/IGListKit/"
  ] + [
    "-fmodule-name=IGListKit_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Diffing_acknowledgement",
  deps = [

  ],
  value = "//Vendor/IGListKit/pod_support_buildable:acknowledgement_fragment"
  )
filegroup(
  name = "Default_cxx_hdrs",
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/**/*.h",
          "Source/Common/Internal/*.h",
          "Source/Internal/*.h"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/**/*.h",
          "Source/Common/Internal/*.h",
          "Source/Internal/*.h"
        ],
        exclude_directories = 1
        )
    }
    ),
  visibility = [
    "//visibility:public"
  ]
  )
filegroup(
  name = "Default_cxx_union_hdrs",
  srcs = [
    "Default_cxx_hdrs",
    "IGListKit_hdrs"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Default_cxx_includes",
  include = [
    "Vendor/IGListKit/pod_support/Headers/Public/"
  ]
  )
objc_library(
  name = "Default_cxx",
  enable_modules = 1,
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/**/*.mm"
        ],
        exclude = [
          "Source/**/*.m"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/**/*.mm"
        ],
        exclude = [
          "Source/**/*.m"
        ],
        exclude_directories = 1
        )
    }
    ),
  hdrs = [
    ":Default_cxx_union_hdrs",
    ":IGListKit_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "IGListKit",
    [
      "Source/**/*.pch"
    ]
    ),
  includes = [
    "IGListKit_module_map"
  ],
  sdk_frameworks = select(
    {
      "//conditions:default": [
        "UIKit"
      ],
      ":osxCase": [
        "Cocoa"
      ],
      ":tvosCase": [
        "UIKit"
      ]
    }
    ),
  sdk_dylibs = [
    "c++"
  ],
  deps = [
    ":Diffing"
  ] + [
    ":Default_cxx_includes"
  ],
  copts = [
    "-std=c++11",
    "-stdlib=libc++",
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
    "-IVendor/IGListKit/pod_support/Headers/Public/IGListKit/"
  ] + [
    "-fmodule-name=IGListKit_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Default_cxx_acknowledgement",
  deps = [

  ],
  value = "//Vendor/IGListKit/pod_support_buildable:acknowledgement_fragment"
  )
filegroup(
  name = "Default_hdrs",
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/**/*.h",
          "Source/Common/Internal/*.h",
          "Source/Internal/*.h"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/**/*.h",
          "Source/Common/Internal/*.h",
          "Source/Internal/*.h"
        ],
        exclude_directories = 1
        )
    }
    ),
  visibility = [
    "//visibility:public"
  ]
  )
filegroup(
  name = "Default_union_hdrs",
  srcs = [
    "Default_hdrs",
    "IGListKit_hdrs"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Default_includes",
  include = [
    "Vendor/IGListKit/pod_support/Headers/Public/"
  ]
  )
objc_library(
  name = "Default",
  enable_modules = 1,
  srcs = select(
    {
      "//conditions:default": glob(
        [
          "Source/**/*.m"
        ],
        exclude_directories = 1
        ),
      ":tvosCase": glob(
        [
          "Source/**/*.m"
        ],
        exclude_directories = 1
        )
    }
    ),
  hdrs = [
    ":Default_union_hdrs",
    ":IGListKit_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "IGListKit",
    [
      "Source/**/*.pch"
    ]
    ),
  includes = [
    "IGListKit_module_map"
  ],
  sdk_frameworks = select(
    {
      "//conditions:default": [
        "UIKit"
      ],
      ":osxCase": [
        "Cocoa"
      ],
      ":tvosCase": [
        "UIKit"
      ]
    }
    ),
  sdk_dylibs = [
    "c++"
  ],
  deps = [
    ":Default_cxx",
    ":Diffing"
  ] + [
    ":Default_includes"
  ],
  copts = [
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
    "-IVendor/IGListKit/pod_support/Headers/Public/IGListKit/"
  ] + [
    "-fmodule-name=IGListKit_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Default_acknowledgement",
  deps = [

  ],
  value = "//Vendor/IGListKit/pod_support_buildable:acknowledgement_fragment"
  )