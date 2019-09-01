load(
  "//Vendor/rules_pods/BazelExtensions:extensions.bzl",
  "pch_with_name_hint",
  "acknowledged_target",
  "gen_module_map",
  "gen_includes"
)

filegroup(
  name = "PINRemoteImage_hdrs",
  srcs = glob([ "Source/Classes/**/*.h"],exclude_directories = 1),
  visibility = [
    "//visibility:public"
  ]
)

objc_library(
  name = "PINRemoteImage",
  enable_modules = 1,
  srcs = glob(["Source/Classes/*.m"],exclude_directories = 1),
  hdrs = [
    ":PINRemoteImage_hdrs",
  ],
  pch = pch_with_name_hint("PINRemoteImage",[]),
  deps = [
    "//Vendor/PINCache"
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
    "-Wno-error=nonportable-include-path",
    "-IPINRemoteImage/Source/Classes/",
    "-IPINRemoteImage/Source/Classes/AnimatedImages",
    "-IPINRemoteImage/Source/Classes/Categories",
    "-IPINRemoteImage/Source/Classes/ImageCategories",
    "-IPINRemoteImage/Source/Classes/PINCache",
  ],
  visibility = [
    "//visibility:public"
  ],
  sdk_frameworks = [
        "AVFoundation",
        "CoreMedia",
        "CoreText",
        "CoreLocation",
        "AudioToolbox",
        "Security",
        "UIKit",
        "CoreGraphics",
        "QuartzCore",
        "Foundation",
        "CoreImage",
        "Intents",
        "SystemConfiguration",
        "CoreServices",
        "SafariServices"
  ]
)