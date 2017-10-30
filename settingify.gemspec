# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'settingify/version'

Gem::Specification.new do |spec|
  spec.name          = "settingify"
  spec.version       = Settingify::VERSION
  spec.authors       = ["Sergey Gernyak"]
  spec.email         = ["sergeg1990@gmail.com"]
  spec.summary       = %q{Global setting system for Rails}
  spec.description   = %q{System for managing global settings trough database}
  spec.homepage      = "https://github.com/alterego-labs/settingify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "traco", "3.1.6"

  spec.add_development_dependency "activesupport",  ">= 4.0.4"
  spec.add_development_dependency "activerecord",   ">= 4.0.4"
  spec.add_development_dependency "activemodel",    ">= 4.0.4"
  spec.add_development_dependency "rails",          ">= 4.0.4"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",         "~> 3.4.0"
  spec.add_development_dependency "rspec-its",     "1.2.0"
  spec.add_development_dependency "pry-nav",       "0.2.3"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'generator_spec', '0.9.3'

  spec.add_development_dependency 'json', '1.8.6'
end
