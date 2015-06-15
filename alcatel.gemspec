# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alcatel/version'

Gem::Specification.new do |spec|
  spec.name          = "alcatel"
  spec.version       = Alcatel::VERSION
  spec.authors       = ["Neb Yurii"]
  spec.email         = ["neb@region87.org"]
  spec.summary       = %q{Ruby gem for management Alcatel-Lucent 7302 via SSH.}
  spec.description   = %q{This gem aims to provide transport-flexible functionality, for easy communication with Alcatel-Lucent 7302 devices.}
  spec.homepage      = "http://chukothost.ru"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
