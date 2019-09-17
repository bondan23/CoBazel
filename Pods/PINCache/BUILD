objc_library(
    name = "PINCache",
    module_map = "BazelSupport/PINCache/PINCache.modulemap",
    srcs = glob([
        "Source/**/*.m",
    ]),
    hdrs = glob([
        "BazelSupport/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
    ],
    includes = [
        "BazelSupport",
        "BazelSupport/PINCache"
    ],
    deps = [
        "//Pods/PINOperation"  
    ],
    visibility = ["//visibility:public"],
)