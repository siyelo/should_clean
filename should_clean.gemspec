# -*- encoding: utf-8 -*-
require File.expand_path('../lib/should_clean/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sachin Ranchod", "Dalibor Nasevic"]
  gem.email         = ["sachin.ranchod@gmail.com", "dalibor.nasevic@gmail.com"]
  gem.description   = %q{Utility to remove unneeded shoulds from your RSpec test descriptions - 'it "should do something"' becomes 'it "does something"'}
  gem.summary       = %q{It changes "it should do" to "it does" in your RSpec files}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "should_clean"
  gem.require_paths = ["lib"]
  gem.version       = ShouldClean::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency "rspec"
end
