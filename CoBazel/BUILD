load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

licenses(["notice"])

## Resources

objc_library(
    name = "CoBazelResources",
    data = ["Base.lproj/LaunchScreen.storyboard"],
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

# # Tweaks
# objc_library(
#     name = "Tweaks",
#     deps = ["//Vendor/Tweaks"]
# )

# objc_library(
#     name = "PINRemoteImage",
#     deps = ["//Vendor/PINRemoteImage"],
#     copts = [
#         "-TOT Vendor/PINRemoteImage/Source/Classes"
#     ]
# )

## Code
swift_library(
    name = "CoBazelSources",
    srcs = [
        "AppDelegate.swift",
        "ViewController.swift",
    ],
    deps = [
        "//DepsObjC:DepsObjC",
        "//DepsMix:DepsMix",
        "//Vendor/Tweaks",
        "//Texture:Texture",
        "//IGListKit:IGListKit",
    ]
)

ios_application(
    name = "CoBazel",
    # app_icons = ["//:Assets.xcassets"],
    bundle_id = "com.tokopedia.CoBazel",
    families = [
        "iphone",
    ],
    infoplists = [":Info.plist"],
    minimum_os_version = "10.0",
    deps = [
        ":CoBazelResources",
        ":CoBazelSources"
    ],
)