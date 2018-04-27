Pod::Spec.new do |s|
  s.name             = 'MJPathView'
  s.version          = '1.0.0'
  s.summary          = 'By showing the trace on xib or sb, you can preview the animation track easily and support the screen adaptation.'
  s.homepage         = 'https://github.com/iosLiuPeng/MJPathView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iosLiuPeng' => '392009255@qq.com' }
  s.source           = { :git => 'https://github.com/iosLiuPeng/MJPathView.git', :tag => s.version.to_s }
  s.platform     = :ios 
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks = 'UIKit'
  # s.resource_bundles = {
  #   'view' => ['Assets/*.png']
  # }
end
