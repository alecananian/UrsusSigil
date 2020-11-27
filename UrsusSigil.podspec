Pod::Spec.new do |s|
  s.name = "UrsusSigil"
  s.version = "1.2.3"
  s.summary = "A library for generating Urbit sigils."
  s.homepage = "https://github.com/dclelland/UrsusSigil"
  s.license = { type: 'MIT' }
  s.author = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source = { git: "https://github.com/dclelland/UrsusSigil.git", tag: "1.2.3" }
  s.swift_versions = ['5.1', '5.2']
  
  s.ios.deployment_target = '13.0'
  # s.osx.deployment_target = '10.15'
  
  s.source_files = 'Sources/UrsusSigil/**/*.swift'
  s.resources = 'Sources/UrsusSigil/Resources/**/*'
  
  s.dependency 'SwiftSVG', '~> 2.0'
  s.dependency 'UrsusAtom', '~> 1.2'
end
