Pod::Spec.new do |s|
  s.name             = 'SegMenu'
  s.version          = '0.1.1'
  s.summary          = 'A SegMenu for multiply categories App, such as News, Online Market'
  s.description      = <<-DESC
A SegMenu for multiply categories App, such as News, Online Market. We can use it create a menu and sub controllers very easily.
                       DESC

  s.homepage         = 'https://github.com/skykywind/SegMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skykywind' => 'jiafujia123@gmail.com' }
  s.source           = { :git => 'https://github.com/skykywind/SegMenu.git', :tag => s.version.to_s }
  s.swift_version = '5.0'

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'SegMenu/Classes/**/*'
  
end
