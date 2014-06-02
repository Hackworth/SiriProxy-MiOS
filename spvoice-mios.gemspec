# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |gem|
  gem.name        = "spvoice-mios"
  gem.version     = SPVoiceMiOS::VERSION
  gem.authors     = ["Jordan Hackworth"]
  gem.email       = ["dev@jordanhackworth.com"]
  gem.summary     = %q{SPVoice Proxy Plugin to control MiOS}
  gem.description = %q{This is a plugin that allows you to control MiOS using SPVoice}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency(%q<mios>, [">= 0.3.0"])
  gem.add_dependency(%q<fuzzy_match>, [">= 2.0.1"])
  gem.add_dependency(%q<chronic>, [">= 0.9.1"])
end
