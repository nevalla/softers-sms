# -*- encoding: utf-8 -*-
require "./lib/softers"
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "softers"
  gem.version       = Softers::VERSION
  gem.authors       = ["Lauri Nevala"]
  gem.email         = ["lauri.nevala@gmail.com"]
  gem.description   = "A simple wrapper for the Softers SMS API"
  gem.summary       = "see description"
  gem.homepage      = "https://github.com/nevalla/softers"

  gem.files         = `git ls-files`.split($/)
  gem.add_dependency('json', ['~> 1.5'])
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
