# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dossier/display/version'

Gem::Specification.new do |spec|
  spec.name          = "dossier-display"
  spec.version       = Dossier::Display::VERSION
  spec.authors       = ["Adam Hunter"]
  spec.email         = ["adamhunter@me.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dossier", "~> 2.8"

  spec.add_development_dependency "bundler",     "~> 1.3"
  spec.add_development_dependency "rspec-rails", "~> 2.13"
  spec.add_development_dependency "rails",       "~> 3.2.13"
  spec.add_development_dependency "capybara",    "~> 2.1"
  spec.add_development_dependency "simplecov",   "~> 0.7"
  spec.add_development_dependency "pry",         ">= 0.9.10"
  spec.add_development_dependency "rake"
end
