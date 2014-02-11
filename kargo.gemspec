# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kargo/version'

Gem::Specification.new do |spec|
  spec.name          = "kargo"
  spec.version       = Kargo::VERSION
  spec.authors       = ["motemen"]
  spec.email         = ["motemen@gmail.com"]
  spec.description   = %q{Tiny download manager; no packages, no dependency resolving}
  spec.summary       = %q{Tiny download manager; no packages, no dependency resolving}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'term-ansicolor'
  spec.add_dependency 'archive-zip'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
