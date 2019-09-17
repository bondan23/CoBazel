load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = 'RxOptional',
    module_name = 'RxOptional',
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
