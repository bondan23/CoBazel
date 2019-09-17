objc_library(
    name = "PINOperation",
    module_map = "BazelSupport/PINOperation/PINOperation.modulemap",
    srcs = glob([
        "Source/**/*.m",
        "Source/**/*.mm",
    ]),
    hdrs = glob([
        "BazelSupport/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
    ],
    includes = [
        "BazelSupport",
        "BazelSupport/PINOperation"
    ],
    visibility = ["//visibility:public"],
)