require "should_clean/version"

module ShouldClean
  autoload :Replacer, 'should_clean/replacer'
  autoload :Cleaner, 'should_clean/cleaner'
  autoload :Adverbs, 'should_clean/adverbs'
  autoload :Conjugator, 'should_clean/conjugator'
  autoload :Converters, 'should_clean/converters'

  def self.clean(text)
    Cleaner.clean(text)
  end
end
