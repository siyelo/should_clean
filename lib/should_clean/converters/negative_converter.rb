module ShouldClean
  module Converters
    class NegativeConverter

      attr_accessor :text

      def initialize(text)
        @text = text
      end

      def convert(match)
        text.gsub(match, 'does not').strip
      end

    end
  end
end
