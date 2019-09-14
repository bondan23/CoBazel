# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

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
    #  'RCTVibration',
    #  'RCTImage',
    #  'RCTGeolocation',
    #  'RCTAnimation',
    #  'RCTActionSheet',
    #  'RCTSettings',
    #  'RCTLinkingIOS',
    #  'RCTCameraRoll',
 ]

 pod 'Folly', :podspec => './react-podspecs/Folly.podspec.json'
 pod 'GLog', :podspec => './react-podspecs/GLog.podspec.json'
 pod 'DoubleConversion', :podspec => './react-podspecs/DoubleConversion.podspec.json'
 pod 'yoga', :podspec => './react-podspecs/yoga.podspec.json'

  # Pods for CoBazel
  pod 'Tweaks', '2.2.0'
  pod 'IGListKit', '3.4.0'
  pod 'Texture', '2.7'
end

post_install do |installer|
  `sed -i '' 's/#import <RCTAnimation\\/RCTValueAnimatedNode.h>/#import \"RCTValueAnimatedNode.h\"/' ./Pods/React/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h`
  `sed -i '' 's#<fishhook/fishhook.h>#\"fishhook.h\"#g' ./Pods/React/Libraries/WebSocket/RCTReconnectingWebSocket.m`

  require 'fileutils'

  remove_unused_yoga_header
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
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
  bazel_files_dir = 'pods-bazel'
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
          `sh find.sh #{pod_name} #{product_module_name}`
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
