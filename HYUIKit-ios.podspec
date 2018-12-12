
Pod::Spec.new do |s|
  s.name             = 'HYUIKit-ios'
  s.version          = '0.0.17'
  s.summary          = 'HYUIKit-ios.'
  s.description      = <<-DESC
iOS中UIKit的一些方法集合
                       DESC
  s.homepage         = 'https://github.com/oceanfive/HYUIKit-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oceanfive' => '849638313@qq.com' }
  s.source           = { :git => 'https://github.com/oceanfive/HYUIKit-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'HYUIKit-ios/Classes/**/*'
  s.frameworks = 'UIKit'
end
