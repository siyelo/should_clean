module ShouldClean
  module Converters
    class NegativeConverter < Converter

      def self.matcher
        /#{NEGATIVE_SPEC}/
      end

      private
      def active_verb
        if verb == 'be'
          if adverb == 'by default'
            @active_verb = 'does not default to'
          else
            @active_verb = 'is not'
          end
        else
          @active_verb = ['does not', adverb, verb].compact.join(' ')
        end
      end
    end
  end
end
