module ShouldClean
  module Converters
    class AdverbConverter < Converter

      def self.matcher
        /should (#{ShouldClean::Adverbs.all.join('|')})/
      end

      def convert
        prefix, postfix = text.split(splitter)
        verb, remainder = postfix.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{prefix}#{adverb} #{active_verb}#{$&}#{remainder}"
      end

      private
      def adverb
        match_data[1]
      end

    end
  end
end
