objc_library(
    name = "IGListKit",
    module_map = "copyheader/IGListKit/IGListKit.modulemap",
    srcs = glob([
        "Source/**/*.m",
        "Source/**/*.mm",
    ]),
    hdrs = glob([
        "copyheader/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
    ],
    includes = [
        "copyheader",
        "copyheader/IGListKit"
    ],
    visibility = ["//visibility:public"],
)