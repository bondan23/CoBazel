objc_library(
    name = "IGListKit",
    module_map = "iglistkitheader/IGListKit/IGListKit.modulemap",
    srcs = glob([
        "Source/**/*.m",
        "Source/**/*.mm",
    ]),
    hdrs = glob([
        "iglistkitheader/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
    ],
    includes = [
        "iglistkitheader",
        "iglistkitheader/IGListKit"
    ],
    visibility = ["//visibility:public"],
)