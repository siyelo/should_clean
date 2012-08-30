# -*- encoding: utf-8 -*-
require File.expand_path('../lib/should_clean/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sachin Ranchod", "Dalibor Nasevic"]
  gem.email         = ["sachin@siyelo.com", "dali@siyelo.com"]
  gem.description   = %q{Clean should from test libraries}
  gem.summary       = %q{It changes "it should do" to "it does"}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "should_clean"
  gem.require_paths = ["lib"]
  gem.version       = ShouldClean::VERSION

  gem.add_development_dependency "rspec"
end
