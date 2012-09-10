module ShouldClean
  module Converters
    class RegularVerbConverter < Converter

      def self.matcher
        /should (be able to)?/
      end

      def convert
        subject, expectation = text.split(splitter, 2)
        verb, object = expectation.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{subject}#{active_verb}#{$&}#{object}"
      end

    end
  end
end
