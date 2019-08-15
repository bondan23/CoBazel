load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")



swift_library(
    name = "TestMix",
    srcs = glob([
        "*.swift",
    ]),
    visibility = ["//visibility:public"],
)

objc_library(
    name = "DepsMix_ObjC",
    deps = [
        ":TestMix"
    ],
    srcs = glob([
        "*.m",
    ]),
    hdrs = glob([
        "*.h",
    ]),
	includes = [
		"."
    ],
    sdk_frameworks = [
        "Foundation"
    ],
    copts = [
        "-DBAZELBUILD"
    ],
    visibility = ["//visibility:public"],
    enable_modules = True,
)

swift_library(
    name = "DepsMix",
    module_name = "DepsMix",
    srcs = glob([
        "*.swift",
    ]),
    deps = [
        ":DepsMix_ObjC",
    ],
	swiftc_inputs = [
		":DepsMix.h"
	],
	copts = [
        "-import-objc-header", 
        "$(location :DepsMix.h)",
        "-Xcc",
        "-I.",
	],
    visibility = ["//visibility:public"],
)