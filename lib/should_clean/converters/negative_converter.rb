module ShouldClean
  module Converters
    class NegativeConverter < Converter

      def self.matcher
        /should( not|n't)/
      end

      def convert
        text.gsub(splitter, 'does not').strip
      end

    end
  end
end
