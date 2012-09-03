require "should_clean/version"
require 'find'

module ShouldClean
  autoload :Replacer,   'should_clean/replacer'
  autoload :Cleaner,    'should_clean/cleaner'
  autoload :Simulator,  'should_clean/simulator'
  autoload :Adverbs,    'should_clean/adverbs'
  autoload :Conjugator, 'should_clean/conjugator'
  autoload :Converters, 'should_clean/converters'

  def self.clean(dir, dry_run = true)
    runner_klass = dry_run ? Simulator : Replacer

    Find.find(dir) do |path|
      if path.match /_spec\.rb$/
        runner = runner_klass.new(path)
        runner.run
      end
    end
  end
end
