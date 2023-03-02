Pod::Spec.new do |s|
  s.name             = 'TMComponent'
  s.version          = '0.1.0'
  s.summary          = 'Some components for TennisMoment'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/RoyJoel/TMComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'RoyJoel' => '1573989249@qq.com' }
  s.source           = { :git => 'https://github.com/RoyJoel/TMComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.0']
  s.dependency 'SnapKit'
  s.source_files = 'TMComponent/Classes/**/*'
  
end

