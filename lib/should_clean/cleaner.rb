module ShouldClean
  module Cleaner
    def self.clean(text)
      convertors = {
        /should( not|n't)/ => Converters::NegativeConverter,
        /should (be able to)?/ => Converters::RegularVerbConverter
        # /should (be able to)?/: IrregularVerbConvertor
        # /should (be able to)?/: AdverbConvertor
      }

      matcher = convertors.keys.detect { |key| text.match(key) }

      if matcher
        converter = convertors[matcher].new(text)
        converter.convert($&)
      else
        puts 'No match'
      end
    end
  end
end
