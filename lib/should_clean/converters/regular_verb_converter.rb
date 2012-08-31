module ShouldClean
  module Converters
    class RegularVerbConverter

      attr_accessor :text

      def initialize(text)
        @text = text
      end

      def convert(match)
        method_name, description = text.split(match)
        verb, rest = description.lstrip.split(/\W/, 2) # split limit gives the regexp match $&
        active_verb = Conjugator.tpp(verb)
        "#{method_name}#{active_verb}#{$&}#{rest}".strip
      end

    end
  end
end
