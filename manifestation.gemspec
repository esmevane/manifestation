# -*- encoding: utf-8 -*-
require File.expand_path('../lib/manifestation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joseph McCormick"]
  gem.email         = ["esmevane@gmail.com"]
  gem.description   = %q{Use JSON manifests to describe and build single files.}
  gem.summary       = %q{Compile file manifests into single files.}
  gem.homepage      = "https://github.com/esmevane/manifestation"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "manifestation"
  gem.require_paths = ["lib"]
  gem.version       = Manifestation::VERSION
end
