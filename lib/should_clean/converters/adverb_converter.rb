module ShouldClean
  module Converters
    class AdverbConverter < Converter

      def self.matcher
        /#{POSITIVE_SPEC}(#{ShouldClean::Adverbs.all.join('|')})/
      end

      def convert
        subject, expectation = text.split(splitter, 2)
        expectation_without_adverb = expectation.split(adverb).last
        verb, object = expectation_without_adverb.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{subject}#{adverb} #{active_verb}#{$&}#{object}"
      end

      private
      def adverb
        match_data[3]
      end
    end
  end
end
