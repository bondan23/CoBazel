objc_library(
    name = 'yoga',
    module_map = 'copyheader/yoga/yoga.modulemap',
    srcs = glob(['ReactCommon/**/*.c', 'ReactCommon/**/*.cpp']),
    hdrs = glob([
        "copyheader/**/*.h",
    ]),
    includes = [
        "copyheader",
        "copyheader/yoga"
    ],
    visibility = ["//visibility:public"]
)