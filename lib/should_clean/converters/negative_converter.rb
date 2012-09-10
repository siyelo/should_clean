module ShouldClean
  module Converters
    class NegativeConverter < Converter

      def self.matcher
        /should( not|n't)/
      end

      def convert
        subject, expectation = text.split(splitter, 2)
        verb, object = expectation.lstrip.split(' ', 2)

        if verb == 'be'
          "#{subject}is not #{object}"
        else
          text.gsub(splitter, 'does not')
        end
      end
    end
  end
end
