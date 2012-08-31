require "should_clean/version"

module ShouldClean
  autoload :Cleaner, 'should_clean/cleaner'
  autoload :Conjugator, 'should_clean/conjugator'
  autoload :Converters, 'should_clean/converters'

  def self.clean(text)
    Cleaner.clean(text)
  end
end
