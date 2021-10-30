# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refinerycms/bits/version'

Gem::Specification.new do |spec|
  spec.name          = "refinerycms-bits"
  spec.version       = Refinerycms::Bits::VERSION
  spec.authors       = ["Isaac Freeman"]
  spec.email         = ["isaac@resolvedigital.co.nz"]
  spec.summary       = %q{Bits and pieces we use on Refinery sites}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.1"
  spec.add_dependency 'refinerycms-core',    '~> 4.0.0'
  spec.add_dependency 'sass-rails', '~> 6.0.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
