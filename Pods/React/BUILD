load("@build_bazel_rules_apple//apple:ios.bzl", "ios_static_framework")

objc_library(
    name = "CxxBridge",
    srcs = glob([
        "copyheader/**/*.h",
        "React/Cxx*/*.h",
        "React/Cxx*/*.m",
        "React/Cxx*/*.mm",
        "ReactCommon/**/*.h",
        "ReactCommon/**/*.cpp",
    ]),
    includes = [
        "copyheader",
        "ReactCommon",
    ],
    sdk_frameworks = [
        "JavaScriptCore"
    ],
    copts = [
        "-DFOLLY_NO_CONFIG",
        "-DFOLLY_MOBILE=1 ",
        "-DFOLLY_USE_LIBCPP=1",
        '-x',
        'objective-c++',
        '-stdlib=libc++',
        '-std=c++14',
    ],
    deps = [
        ":Core",
        "//Pods/Folly"
    ]
)

objc_library(
    name = "RCTText",
    srcs = glob([
        "copyheader/React/*.h",
        "Libraries/Text/*.h",
        "Libraries/Text/*.m",
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
    ],
    deps = [
        "//Pods/yoga",
    ]
)

objc_library(
    name = "RCTNetwork",
    srcs = glob([
        "copyheader/React/*.h",
        "Libraries/Network/*.h",
        "Libraries/Network/*.m",
        "Libraries/Network/*.mm",
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
    ],
    deps = [
        ":Core",
    ],
)

objc_library(
    name = "DevSupport",
    srcs = glob([
        "copyheader/React/*.h",
        "ReactCommon/jschelpers/JavaScriptCore.h",
        "ReactCommon/jschelpers/JSCWrapper.h",
        "ReactCommon/jsinspector/InspectorInterfaces.h",
        "React/DevSupport/*.mm",
        "React/Inspector/*.mm",
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
        "ReactCommon"
    ],
    deps = [
        ":Core",
        ":RCTWebSocket"
    ],
    sdk_frameworks = [
        "JavaScriptCore"
    ],
    copts = [
        '-x',
        'objective-c++',
        '-stdlib=libc++',
        '-std=c++14',
    ],
)

objc_library(
    name = "Testing",
    srcs = glob([
        "copyheader/React/*.h",
        "React/DevSupport/*.m",
        "React/Inspector/*.m",
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
        "ReactCommon"
    ],
    sdk_frameworks = [
        "JavaScriptCore"
    ],
)

objc_library(
    name = "RCTWebSocket",
    srcs = glob([
        "copyheader/React/*.h",
        "Libraries/Blob/*.h",
        "Libraries/Blob/*.m",
        "Libraries/WebSocket/*.h",
        "Libraries/WebSocket/*.m",
        "Libraries/fishhook/*.h",
        "Libraries/fishhook/*.c",
    ]),
    includes = [
        "copyheader"
    ],
    deps = [
        ":Core"
    ]
)

objc_library(
    name = 'Core',
    # module_map = 'copyheader/React/React.modulemap',
    srcs = glob([ 
        "ReactCommon/cxxreact/JSBundleType.h",
        "ReactCommon/jschelpers/JavaScriptCore.h",
        "ReactCommon/jschelpers/JSCWrapper.h",
        "copyheader/React/*.h",
        "React/**/*.c",
        "React/**/*.S",
        'React/**/*.m', 
        'React/**/*.mm', 
        'React/**/*.cpp'
    ], exclude = [
        "copyheader/React/JSBundleType.h",
        "copyheader/React/JavaScriptCore.h",
        "React/DevSupport/*",
        "React/Inspector/*",
        "React/Cxx*/*",
        "React/Base/RCTBatchedBridge.mm",
        "React/Executors/*",
        "ReactCommon/yoga/*"
    ]),
    # hdrs = glob([
    #     "**/*.h"
    # ]),
    includes = [
        "copyheader",
        "copyheader/React",
        "ReactCommon",
    ],
    sdk_frameworks = [
        "QuartzCore",
        "JavaScriptCore"
    ],
    deps = ['//Pods/yoga'],
    visibility = ['//visibility:public'],
)

# objc_library(
#     name = "React",
#     module_map = 'copyheader/React/React.modulemap',
#     srcs = glob([ 
#         "React/**/*.c",
#         "React/**/*.S",
#         'React/**/*.m', 
#     ], exclude = [
#         "copyheader/React/JSBundleType.h",
#         "copyheader/React/JavaScriptCore.h",
#         "React/DevSupport/*",
#         "React/Inspector/*",
#         "React/Cxx*/*",
#         "React/Base/RCTBatchedBridge.mm",
#         "React/Executors/*",
#         "ReactCommon/yoga/*"
#     ]),
#     hdrs = glob([
#         "copyheader/**/*.h"
#     ]),
#     includes = [
#         "copyheader",
#         "copyheader/React",
#         "ReactCommon",
#     ],
#     sdk_frameworks = [
#         "QuartzCore",
#         "JavaScriptCore",
#         "CoreTelephony"
#     ],
#     deps = [
#         '//Pods/yoga',
#         ":Testing",
#         ":CxxBridge",
#         ":DevSupport",
#         ":RCTWebSocket",
#         ":RCTText",
#         ":RCTNetwork"
#     ],
#     visibility = ['//visibility:public'],
# )


objc_library(
    name = 'React',
    module_map = 'copyheader/React/React.modulemap',
    srcs = glob([ 
        'React/**/*.m',  
        'React/**/*.c', 
        'Libraries/**/*.c',
        'React/**/*.S',
        'Libraries/**/*.m',
    ]),
    hdrs = glob([
        'copyheader/React/*.h', 
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
        "ReactCommon",
    ],
    sdk_frameworks = [
        "CoreTelephony"
    ],
    deps = ['//Pods/yoga', '//Pods/Folly', ':React_cxx'],
    visibility = ['//visibility:public']
)

objc_library(
    name = 'React_cxx',
    srcs = glob([ 
        'copyheader/**/*.h', 
        'ReactCommon/**/*.h', 
        'ReactCommon/**/*.cpp',
        'Libraries/**/*.mm',
        'React/**/*.mm', 
        'React/**/*.cpp'
    ]),
    includes = [
        "copyheader",
        "copyheader/React",
        "ReactCommon",
    ],
    deps = ['//Pods/yoga', '//Pods/Folly'],
    visibility = ['//visibility:public'],
    copts = [
        '-x',
        'objective-c++',
        '-stdlib=libc++',
        '-std=c++14',
    ]
)