objc_library(
    name = 'TransitionKit',
    module_map = 'BazelSupport/TransitionKit/TransitionKit.modulemap',
    srcs = glob(['Code/*.m']),
    hdrs = glob(['BazelSupport/**/*.h']),
    includes = [
        'BazelSupport',
        'BazelSupport/TransitionKit',
    ],
    visibility = ['//visibility:public'],
)