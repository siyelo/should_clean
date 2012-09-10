module ShouldClean
  module Converters
    class Converter
      SUBJECT = /^\s*(it\s*'|it\s*"|it\s*%{)\s*/
      NEGATIVE_SPEC = /#{SUBJECT}(should not|shouldn't)\s*/
      POSITIVE_SPEC = /#{SUBJECT}(should)\s*/

      attr_accessor :text, :splitter

      def initialize(text, match_data)
        @text = text
        @splitter = match_data[2]
      end

      def convert
        "#{subject}#{active_verb}#{joiner}#{object}"
      end

      private
      def verb
        @verb ||= verb_and_object.first
      end

      def adverb
        @adverb = ShouldClean::Adverbs.all.detect do |a|
          adverb_and_expectation.lstrip.start_with?(a)
        end
      end

      def subject
        @subject = subject_and_expectation.first
      end

      def object
        @object ||= verb_and_object.last
      end

      def joiner
        expectation.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        @joiner = $&
      end

      def expectation
        return @expectation if @expectation

        if adverb
          @expectation = adverb_and_expectation.split(adverb).last
        else
          @expectation = adverb_and_expectation
        end
      end

      def adverb_and_expectation
        @adverb_and_expectation ||= subject_and_expectation.last
      end

      def verb_and_object
        @verb_and_object ||= expectation.lstrip.split(/\W/, 2)
      end

      def subject_and_expectation
        @subject_and_expectation ||= text.split(splitter, 2)
      end
    end
  end
end
