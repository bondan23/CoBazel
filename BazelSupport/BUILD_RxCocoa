load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")


objc_library(
    name = 'RxCocoa_objc',
    srcs = glob(['RxCocoa/**/*.m', 'RxCocoa/**/*.h']),
    visibility = ['//visibility:private']
)

swift_library(
    name = 'RxCocoa',
    module_name = 'RxCocoa',
    srcs = glob(['**/*.swift']),
    visibility = ['//visibility:public'],
    deps = ['//Pods/RxSwift', 'RxCocoa_objc'],
    copts = [
        '-swift-version',
        '4',
        # TESTING BRIDGING HEADER #
        # '-Xcc',
        # '-fmodule-map-file=Pods/RxCocoa/BazelSupport/RxCocoa/RxCocoa.modulemap'
        '-import-objc-header',
        'Pods/RxCocoa/BazelSupport/RxCocoa/RxCocoaRuntime.h',
    ]
)