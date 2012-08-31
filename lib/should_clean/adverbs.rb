module ShouldClean
  module Adverbs
    extend self

    def all
      @adverbs ||= load_adverbs
    end

    private
    def load_adverbs
      data = File.read( __FILE__ ).split( /^__END__$/ ).last.strip
      verbs = data.split("\n").map { |line| line.strip }
    end
  end
end

__END__
by default
only
automatically
auto
correctly
