load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = 'NSObject_Rx',
    module_name = 'NSObject_Rx',
    srcs = glob(['**/*.swift']),
    visibility = ['//visibility:public'],
    deps = [
        '//Pods/RxSwift'
    ],
    copts = [
        '-swift-version',
        '4'
    ]
)
