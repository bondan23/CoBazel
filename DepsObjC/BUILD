objc_library(
    name = "DepsObjC",
    hdrs = glob([
        "**/*.h",
    ]),
    srcs = glob([
        "**/*.m",
    ]),
    includes = [
    	".",
    ],
    sdk_frameworks = [
        "Foundation",
    ],
    enable_modules = 1,
    module_name = "DepsObjC",
    visibility = ["//visibility:public"],
)
