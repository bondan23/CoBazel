load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = 'RxCocoa_Texture',
    module_name = 'RxCocoa_Texture',
    srcs = glob(['**/*.swift']),
    deps = [
        '//Pods/RxSwift',
        '//Pods/RxCocoa',
        '//Pods/Texture'
    ],
    visibility = ['//visibility:public'],
    copts = [
        '-swift-version',
        '4'
    ]
)