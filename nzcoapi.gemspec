# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nzcoapi/version'

Gem::Specification.new do |spec|
  spec.name          = "nzcoapi"
  spec.version       = Nzcoapi::VERSION
  spec.authors       = ["T Pearse"]
  spec.email         = ["t.pearse@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{Simple and fast authenticating API wrapper for the New Zealand Companies Office}
  spec.description   = %q{Search the New Zealand Companies Office register by company name, company number and director. }
  spec.homepage      = "https://github.com/t-pearse/nzcoapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty"
  spec.add_dependency "nokogiri"
  spec.add_dependency "figaro"
end
