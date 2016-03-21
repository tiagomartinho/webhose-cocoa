Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "Webhose"
  s.summary = "A simple way to access the webhose.io API"
  s.requires_arc = true
  s.version = "0.1.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Tiago Martinho" => "t.martinho@live.com.pt" }
  s.homepage = "https://bitbucket.org/tiagomartinho/webhose-cocoa"
  s.source = { :git => "https://bitbucket.org/tiagomartinho/webhose-cocoa.git", :tag => "#{s.version}"}
  s.source_files = "webhose-cocoa/**/*.{swift}"
end
