objc_library(
    name = 'RKValueTransformers',
    module_map = 'BazelSupport/RKValueTransformers/RKValueTransformers.modulemap',
    srcs = glob(['Code/*.m']),
    hdrs = glob(['BazelSupport/RKValueTransformers/*.h']),
    includes = [
        'BazelSupport',
        'BazelSupport/RKValueTransformers'
    ],
    visibility = ['//visibility:public'],
)