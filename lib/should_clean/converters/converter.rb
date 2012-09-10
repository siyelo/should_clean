module ShouldClean
  module Converters
    class Converter
      SUBJECT = /^\s*(it\s*'|it\s*"|it\s*%{)\s*/
      NEGATIVE_SPEC = /#{SUBJECT}(should not|shouldn't)\s*/
      POSITIVE_SPEC = /#{SUBJECT}(should)\s*/

      attr_accessor :text, :match_data

      def initialize(text, match_data)
        @text = text
        @match_data = match_data
      end

      private
      def splitter
        match_data[2]
      end

    end
  end
end
