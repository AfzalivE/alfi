# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alfi/version'

Gem::Specification.new do |spec|
  spec.name          = 'alfi2'
  spec.version       = Alfi::VERSION
  spec.authors       = ['cesar ferreira', 'Afzal Najam']
  spec.email         = ['afzalnaj+dev@gmail.com']

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = 'Android Library Finder'
  spec.description   = 'Android Library Finder'
  spec.homepage      = "https://github.com/afzalive/alfi"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'webmock', '~> 3.3.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_dependency 'bundler',  '~> 1.7'
  spec.add_dependency 'json',  '~> 2.0.2'
  spec.add_dependency 'colorize',  '~> 0.7'
end
