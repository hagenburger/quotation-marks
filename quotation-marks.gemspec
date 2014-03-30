# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quotation-marks/version'

Gem::Specification.new do |spec|
  spec.name          = 'quotation-marks'
  spec.version       = QuotationMarks::VERSION
  spec.authors       = ['Nico Hagenburger']
  spec.email         = ['nico@hagenburger.net']
  spec.description   = %q{An easy to use mixin for quotation marks in Sass}
  spec.summary       = %q{I18n quotation marks for Sass}
  spec.homepage      = 'http://quotation-marks.org'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sass', '>= 3.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end

