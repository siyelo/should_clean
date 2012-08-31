module ShouldClean
  module Converters
    autoload :Converter, 'should_clean/converters/converter'
    autoload :NegativeConverter, 'should_clean/converters/negative_converter'
    autoload :RegularVerbConverter, 'should_clean/converters/regular_verb_converter'
    autoload :AdverbConverter, 'should_clean/converters/adverb_converter'
  end
end
