module ShouldClean
  module Converters
    class Converter
      attr_accessor :text, :match_data

      def initialize(text, match_data)
        @text = text
        @match_data = match_data
      end

      private
      def splitter
        match_data[0]
      end

    end
  end
end
