Pod::Spec.new do |s|
  s.name         = "Amadeus"
  s.version      = "0.0.1"
  s.summary      = "Swift library for the Amadeus travel APIs, providing hotel, flight, airport, and other travel related APIs"
  s.homepage     = "https://github.com/carlosRodriguezGonzalez/amadeus-swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors            = { "Carlos Rodriguez Gonzalez" => "carlosrg1997@hotmail.com" }
  s.social_media_url   = "https://twitter.com/AmadeusITGroup"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/carlosRodriguezGonzalez/amadeus-swift.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Classes/**/*"
end
