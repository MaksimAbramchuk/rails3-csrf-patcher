# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails3_csrf_patcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails3_csrf_patcher'
  spec.version       = Rails3CsrfPatcher::VERSION
  spec.authors       = ['Maxim Abramchuk']
  spec.email         = ['maximabramchuck@gmail.com']
  spec.summary       = 'Ruby gem which patches your Rails 3 application to protect it from the CSRF vulnerability.'
  spec.description   = 'Ruby gem which patches your Rails 3 application to protect it from the CSRF vulnerability.'
  spec.homepage      = 'https://github.com/MaximAbramchuck/rails3_csrf_patcher'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
