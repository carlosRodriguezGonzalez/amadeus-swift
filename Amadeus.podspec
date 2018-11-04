Pod::Spec.new do |s|
  s.name         = "Amadeus"
  s.version      = "0.0.2"
  s.summary      = "Swift library for the Amadeus travel APIs, providing hotel, flight, airport, and other travel related APIs"
  s.homepage     = "https://github.com/carlosRodriguezGonzalez/amadeus-swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors            = { "Carlos Rodriguez Gonzalez" => "carlosrg1997@hotmail.com" }
  s.social_media_url   = "https://twitter.com/AmadeusITGroup"
  s.platform     = :ios
  s.ios.deployment_target = '10.0'
  s.swift_version = "4.2"

  s.source       = { :git => "https://github.com/carlosRodriguezGonzalez/amadeus-swift.git", :tag => s.version }

  s.source_files = 'Source', 'Source/**/*', 'Source/*.swift'
end
