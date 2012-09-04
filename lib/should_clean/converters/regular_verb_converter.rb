module ShouldClean
  module Converters
    class RegularVerbConverter < Converter

      def self.matcher
        /should (be able to)?/
      end

      def convert
        method_name, description = text.split(splitter, 2)
        verb, rest = description.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{method_name}#{active_verb}#{$&}#{rest}"
      end

    end
  end
end
