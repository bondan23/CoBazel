objc_library(
    name = "Texture",
    module_map = "copyheader/AsyncDisplayKit/Texture.modulemap",
    srcs = glob([
        "Source/**/*.m",
        "Source/**/*.mm",
    ]),
    hdrs = glob([
        "copyheader/**/*.h",
    ]),
    sdk_frameworks = [
        "UIKit",
        "Foundation",
        "Photos",
        "MapKit",
        "AssetsLibrary"
    ],
    includes = [
        "copyheader",
        "copyheader/AsyncDisplayKit"
    ],
    visibility = ["//visibility:public"],
)