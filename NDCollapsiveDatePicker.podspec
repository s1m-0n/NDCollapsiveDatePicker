#
# Be sure to run `pod lib lint NDCollapsiveDatePicker.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NDCollapsiveDatePicker"
  s.version          = "0.1.0"
  s.summary          = "NDCollapsiveDatePicker is a customized UIPickerView embedded in a View that provides easy access to user selected dates. NDCollapsiveDatePicker's view itsself is highly customizable."
  s.description      = <<-DESC
                       An optional longer description of NDCollapsiveDatePicker

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/s1m-0n/NDCollapseDatePicker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Simon Wicha" => "simon.wicha@nomis-development.net" }
  s.source           = { :git => "https://github.com/s1m-0n/NDCollapsiveDatePicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = 'Pod/Classes/NDCollapsiveDateView.xib'
  s.resource_bundles = {
    'NDCollapsiveDatePicker' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.resources = ["Pod/Classes/NDCollapsiveDateView.xib"]
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
