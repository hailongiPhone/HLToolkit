#
# Be sure to run `pod lib lint HLToolkit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HLToolkit'
  s.version          = '0.1.0'
  s.summary          = 'HLToolkit is a collection of useful classes to develop Apps faster'



  s.homepage         = 'https://github.com/hailongiPhone/HLToolkit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hailong_hh' => 'ghl_hh@hotmail.com' }
  s.source           = { :git => 'https://github.com/hailongiPhone/HLToolkit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HLToolkit/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'HLToolkit' => ['HLToolkit/Assets/*.png']
  # }

  s.public_header_files = 'HLToolkit/Classes/**/*.h'
  s.frameworks = "UIKit", "Foundation"
  # s.dependency 'AFNetworking', '~> 2.3'
end
