objc_library(
    name = 'SOCKit',
    module_map = 'BazelSupport/SOCKit/SOCKit.modulemap',
    srcs = glob(['SOCKit.m']),
    hdrs = glob(['BazelSupport/SOCKit/*.h']),
    includes = [
        'BazelSupport',
        'BazelSupport/SOCKit',
    ],
    copts = [
        '-fno-objc-arc'
    ],
    visibility = ['//visibility:public'],
)