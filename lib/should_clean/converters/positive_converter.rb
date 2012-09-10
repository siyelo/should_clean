module ShouldClean
  module Converters
    class PositiveConverter < Converter

      def self.matcher
        /#{POSITIVE_SPEC}/
      end

      private
      def active_verb
        return @active_verb if @active_verb

        if adverb == 'by default' && verb == 'be'
          @active_verb = "defaults to"
        else
          active_verb  = Conjugator.tpp(verb)
          @active_verb = [adverb, active_verb].compact.join(' ')
        end
      end
    end
  end
end
