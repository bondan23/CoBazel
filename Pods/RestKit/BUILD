objc_library(
    name = 'RestKit',
    module_map = 'BazelSupport/RestKit/RestKit.modulemap',
    srcs = glob([
        'BazelSupport/RestKit/*.h',
        'Code/**/*.m',
    ]),
    deps = [
        '//Pods/TransitionKit',
        '//Pods/SOCKit',
        '//Pods/RKValueTransformers',
        '//Pods/ISO8601DateFormatterValueTransformer',
    ],
    includes = [
        'BazelSupport',
        'BazelSupport/RestKit',
    ],
    sdk_frameworks = [
        'CFNetwork',
        'Security',
        'MobileCoreServices',
        'SystemConfiguration',
        'CoreData'
    ],
    visibility = ['//visibility:public'],
)