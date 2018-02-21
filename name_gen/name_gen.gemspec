# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'name_gen/version'

Gem::Specification.new do |spec|
  spec.name          = "name_gen"
  spec.version       = NameGen::VERSION
  spec.authors       = ["nikitasmall"]
  spec.email         = ["nikitasosnov@yahoo.com"]

  spec.summary       = %q{Simple gem to create names}
  spec.description   = %q{Simple gem to create names}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
