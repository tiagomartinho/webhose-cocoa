Pod::Spec.new do |s|

  s.name = "Webhose"
  s.version = "0.2.0"

  s.summary = "A simple way to access the webhose.io API"

  s.homepage = "https://github.com/tiagomartinho/webhose-cocoa"
  s.license  = "MIT"
  s.authors = { "Tiago Martinho" => "t.martinho@live.com.pt" }

  s.source = { :git => "https://github.com/tiagomartinho/webhose-cocoa.git", :tag => "#{s.version}"}

  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = "webhose-cocoa/Webhose/*.{swift}"

  s.dependency 'Alamofire', '~> 4.3.0'
  s.dependency 'SwiftyJSON', '~> 3.1.4'
end
