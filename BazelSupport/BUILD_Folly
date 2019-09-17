cc_library(
    name = 'Folly',
    srcs = [
        "folly/Bits.cpp",
        "folly/Conv.cpp",
        "folly/Demangle.cpp",
        "folly/StringBase.cpp",
        "folly/Unicode.cpp",
        "folly/dynamic.cpp",
        "folly/json.cpp",
        "folly/portability/BitsFunctexcept.cpp",
        "folly/detail/MallocImpl.cpp"
    ] + glob(['folly/**/*.h']),
    includes = [
        '.',
    ],
    deps = ['//Pods/boost-for-react-native', '//Pods/DoubleConversion', '//Pods/GLog'],
    defines = [
        'FOLLY_NO_CONFIG', 
        'FOLLY_MOBILE=1', 
        'FOLLY_USE_LIBCPP=1', 
        'FOLLY_HAVE_PTHREAD=1',
    ],
    copts = [
         '-Wno-comma', 
         '-Wno-shorten-64-to-32',  
         '-Wno-documentation',
    ],
    visibility = ["//visibility:public"]
)