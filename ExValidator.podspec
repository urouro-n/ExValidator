#
# Be sure to run `pod lib lint ExValidator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "ExValidator"
  s.version = "0.0.1"
  s.summary = "A validation library for Swift"
  s.homepage = "https://github.com/urouro/ExValidator"
  s.license = 'MIT'
  s.author = { "kenta.nakai" => "kenta.nakai@urouro.net" }
  s.source = { :git => "https://github.com/urouro/ExValidator.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/uro_uro_"
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.source_files = "Source/**/*.swift"
end
