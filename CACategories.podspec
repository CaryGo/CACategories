#
#  Be sure to run `pod spec lint CACategories.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  
  s.name         = 'CACategories'
  s.summary      = 'Categories .'
  s.description = <<-DESC
					帮助开发者快速集成项目。
					DESC
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Cary' => 'guojiashuang@live.com' }
  #s.social_media_url = 'http://blog.Cary.com'
  s.homepage     = 'https://github.com/CaryGo/CACategories'

  s.ios.deployment_target = '7.0'
#   s.osx.deployment_target = '10.7'
#   s.watchos.deployment_target = '2.0'
#   s.tvos.deployment_target = '9.0'

  s.source       = { :git => 'https://github.com/CaryGo/CACategories.git', :tag => s.version.to_s }
  s.requires_arc = true
  
  #s.source_files = 'CACategories/*.{h,m}'
  #s.public_header_files = 'CACategories/CACategories'
  s.source_files = 'CACategories/*.h'
#   s.public_header_files = 'GTKit/**/*.h'
  
	s.frameworks = 'Foundation', 'CoreFoundation', 'UIKit'
	s.dependency 'MBProgressHUD'
	s.dependency 'SpinKit'
end
