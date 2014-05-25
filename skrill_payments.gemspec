# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skrill_payments/version'

Gem::Specification.new do |spec|
  spec.name          = "skrill_payments"
  spec.version       = SkrillPayments::VERSION
  spec.authors       = ["macejmic"]
  spec.email         = ["michal.macejko1@gmail.com"]
  spec.description   = %q{Skrill payments}
  spec.summary       = %q{Skrill payments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_dependency('faraday')
  spec.add_dependency('xml-simple')

end
