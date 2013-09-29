# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_renamer/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_renamer"
  spec.version       = RailsRenamer::VERSION
  spec.authors       = ["Joe Letizia"]
  spec.email         = ["joe.letizia@gmail.com"]
  spec.description   = %q{Rename your rails project with ease.}
  spec.summary       = %q{Rename your rails project.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
