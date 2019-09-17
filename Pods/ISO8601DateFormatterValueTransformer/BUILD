objc_library(
    name = 'ISO8601DateFormatterValueTransformer',
    module_map = 'BazelSupport/ISO8601DateFormatterValueTransformer/ISO8601DateFormatterValueTransformer.modulemap',
    srcs = glob(['Code/*.m']),
    hdrs = glob(['BazelSupport/ISO8601DateFormatterValueTransformer/*.h']),
    includes = [
        'BazelSupport',
        'BazelSupport/ISO8601DateFormatterValueTransformer'
    ],
    visibility = ['//visibility:public'],
    deps = [
        '//Pods/RKValueTransformers'
    ]
)