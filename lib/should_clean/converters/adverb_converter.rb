module ShouldClean
  module Converters
    class AdverbConverter < Converter

      def self.matcher
        /should (#{ShouldClean::Adverbs.all.join('|')})/
      end

      def convert
        subject, expectation = text.split(splitter, 2)
        verb, object = expectation.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{subject}#{adverb} #{active_verb}#{$&}#{object}"
      end

      private
      def adverb
        match_data[1]
      end

    end
  end
end
