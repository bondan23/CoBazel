load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = 'RxKeyboard',
    module_name = 'RxKeyboard',
    srcs = glob(['**/*.swift']),
    deps = [
        '//Pods/RxSwift',
        '//Pods/RxCocoa',
    ],
    visibility = ['//visibility:public'],
    copts = [
        '-swift-version',
        '4'
    ]
)