# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'money/version'

Gem::Specification.new do |spec|
  spec.name          = 'mod_money_exchange'
  spec.version       = Money::VERSION
  spec.authors       = ['nikitasmall']
  spec.email         = ['nikitasosnov@yahoo.com']

  spec.summary       = 'Example exchange gem'
  spec.description   = 'Example exchange gem'
  # spec.homepage      = 'TODO: Put your gem's website or public repo URL here.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'nokogiri'
end
