objc_library(
    name = "PINRemoteImage",
    module_map = "BazelSupport/PINRemoteImage/PINRemoteImage.modulemap",
    srcs = glob([
        "Source/**/*.m",
    ]),
    hdrs = glob([
        "BazelSupport/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
        "Accelerate",
        "ImageIO",
    ],
    includes = [
        "copyheader",
        "BazelSupport/PINRemoteImage"
    ],
    deps = [
        "//Pods/PINOperation",  
        "//Pods/PINCache",  
    ],
    visibility = ["//visibility:public"],
    copts = [
        "-framework UIKit",
        "-DPIN_TARGET_IOS",
        "-DUSE_PINCACHE"
    ]
)