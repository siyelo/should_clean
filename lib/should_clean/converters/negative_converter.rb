module ShouldClean
  module Converters
    class NegativeConverter < Converter

      def self.matcher
        /should( not|n't)/
      end

      def convert
        text.gsub(splitter, 'does not')
      end

    end
  end
end
