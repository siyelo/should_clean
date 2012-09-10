module ShouldClean
  module Cleaner
    def self.clean(text)

      # order of convertors matter
      convertors = [
        Converters::NegativeConverter,
        Converters::PositiveConverter
      ]

      convertor = convertors.detect { |converter| text.match(converter.matcher) }

      if convertor
        convertor.new(text, Regexp.last_match).convert
      end
    end
  end
end
