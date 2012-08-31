module ShouldClean
  module Conjugator
    extend self

    # Hash of irregular verb, read from the DATA section of the file
    IRREGULAR_VERBS = {}

    def third_person_present(verb)
      @irregular_verbs ||= load_irregular_verbs
      verb = verb.to_s.downcase

      if result = get_irregular(verb)
        result
      else
        get_regular(verb)
      end
    end
    alias :tpp :third_person_present

    private
    def get_irregular(verb)
      @irregular_verbs[verb] or return nil
    end

    ### Conjugate the specified +verb+ in the present tense third person.
    def get_regular(verb)
      case verb
      when /(ch|s|sh|x|z)$/
        return verb + 'es'
      when /(ay|ey|oy|uy)$/
        return verb + 's'
      when /[^aeiou]y$/
        return verb[ 0..-2 ] + 'ies'
      else
        return verb + 's'
      end
    end

    def load_irregular_verbs
      data = File.read( __FILE__ ).split( /^__END__$/ ).last.strip

      verbs = data.split("\n").map do |line|
        line.split(/\|/).map { |verb| verb.strip }
      end

      Hash[*verbs.flatten]
    end
  end
end

__END__
be       | is
do       | does
go       | goes
have     | has
outdo    | outdoes
predo    | predoes
redo     | redoes
undergo  | undergoes
undo     | undoes
rollback | rolls back
setup    | sets up
