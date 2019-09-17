load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

objc_library(
    name = "Resources",
    data = [
        "DKCamera/DKCameraResource.bundle",
        "DKImagePickerController/DKImagePickerController.bundle"
    ],
    sdk_frameworks = [
        "Foundation",
        "UIKit",
        "Photos"
    ]
)

swift_library(
    name = 'DKImagePickerController',
    module_name = 'DKImagePickerController',
    srcs = glob(['**/*.swift']),
    deps = [
        ":Resources"
    ],
    visibility = ['//visibility:public'],
    copts = [
        '-swift-version',
        '4'
    ]
)