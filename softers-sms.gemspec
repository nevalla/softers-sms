# -*- encoding: utf-8 -*-
require File.expand_path('../lib/softers-sms/version', __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "softers-sms"
  gem.version       = SoftersSms::VERSION
  gem.authors       = ["Lauri Nevala"]
  gem.email         = ["lauri.nevala@gmail.com"]
  gem.description   = "A Ruby wrapper for the Softers SMS API"
  gem.summary       = "see description"
  gem.homepage      = "https://github.com/nevalla/softers"

  gem.files         = `git ls-files`.split($/)
  gem.add_dependency('json', ['~> 1.5'])
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
