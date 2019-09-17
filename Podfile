# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'CoBazel' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
 pod 'React', :podspec => './react-podspecs/React.podspec.json', :subspecs => [
     'Core',
     'CxxBridge',
     'DevSupport',
     'RCTText',
     'RCTNetwork',
     'RCTWebSocket',
     'RCTVibration',
     'RCTImage',
     'RCTGeolocation',
     'RCTAnimation',
     'RCTActionSheet',
     'RCTSettings',
     'RCTLinkingIOS',
     'RCTCameraRoll',
 ]

 pod 'Folly', :podspec => './react-podspecs/Folly.podspec.json'
 pod 'GLog', :podspec => './react-podspecs/GLog.podspec.json'
 pod 'DoubleConversion', :podspec => './react-podspecs/DoubleConversion.podspec.json'
 pod 'yoga', :podspec => './react-podspecs/yoga.podspec.json'

  # Pods for CoBazel
  # pod 'IGListKit', '3.4.0'
  pod 'Tweaks', '2.2.0'
  pod 'Texture/IGListKit', '2.7'
  pod 'Texture/PINRemoteImage', '2.7'

  pod 'RxSwift', '~> 4.1.2'
  pod 'RxCocoa', '~> 4.1.2'
  pod 'WARangeSlider', :git => 'https://github.com/tokopedia/RangeSlider.git', :commit => 'b0a8ebefb21cd80f5f4300f7fe4b1f7a535340d0'
  pod 'RxOptional', '~>3.5.0'
  pod 'NSObject+Rx', '~>2.0.0'
  pod 'RestKit/Core',  '~> 0.27.0'
  pod 'RestKit/Testing',  '~> 0.27.0'
  pod 'DKImagePickerController', :git => 'git@github.com:ferico55/DKImagePickerController.git', :branch =>'3.8.1-tkpd'
  pod 'SnapKit', '~> 4.0.0'
  pod 'RxKeyboard', '~> 0.8.3'
  pod 'SkeletonView', '~> 1.2.1'
  pod 'SwiftOverlays', :git => 'git@github.com:jeffersonsetiawan/SwiftOverlays.git', :commit => 'f2828459174c6d28979ae109f7ed1a69c8e33b51'
  pod 'RxCocoa-Texture', :git => 'git@github.com:ferico55/RxCocoa-Texture.git', :branch =>'2.2.2-tkpd'
end

post_install do |installer|
  `sed -i '' 's/#import <RCTAnimation\\/RCTValueAnimatedNode.h>/#import \"RCTValueAnimatedNode.h\"/' ./Pods/React/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h`
  `sed -i '' 's#<fishhook/fishhook.h>#\"fishhook.h\"#g' ./Pods/React/Libraries/WebSocket/RCTReconnectingWebSocket.m`

  require 'fileutils'

  remove_unused_yoga_header
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
      config.build_settings['SWIFT_VERSION'] = '4'
      config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'

      if target.name == "Texture"
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = '$(inherited) "YOGA=0"'
      end

      if target.name == 'yoga'
        target.build_configurations.each do |config|
            config.build_settings['GCC_TREAT_WARNINGS_AS_ERRORS'] = 'NO'
            config.build_settings['GCC_WARN_64_TO_32_BIT_CONVERSION'] = 'NO'
        end
      end

    end
  end

  # Assuming we're at the root dir
  bazel_files_dir = 'BazelSupport'
  if File.directory?(bazel_files_dir)
    installer.pod_targets.flat_map do |pod_target|
      pod_name = pod_target.pod_name
      product_module_name = pod_target.product_module_name
      # Copy the file at pods-bazel/BUILD_pod_name to Pods/pod_name/BUILD,
      # override existing file if needed
      bazel_file = bazel_files_dir + '/BUILD_' + pod_name
      if File.file?(bazel_file)
        # Generate copyheader
        if pod_name != "boost-for-react-native"
          `sh bazelsupport.sh #{pod_name} #{product_module_name}`
        end
        FileUtils.cp(bazel_file, 'Pods/' + pod_name + '/BUILD', :preserve => false)
      end
    end
  end
end

def remove_unused_yoga_header
  # some imported headers break the compilation because they contain C++ code
  filepath = './Pods/Target Support Files/yoga/yoga-umbrella.h'
  
  contents = []
  
  file = File.open(filepath, 'r')
  file.each_line do | line |
      contents << line
  end
  file.close
  
  contents.delete_at(14) # #import "YGNodePrint.h"
  contents.delete_at(14) # #import "Yoga-internal.h"
  
  file = File.open(filepath, 'w') do |f|
      f.puts(contents)
  end
end
