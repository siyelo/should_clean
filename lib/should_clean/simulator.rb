require 'fileutils'
require 'tempfile'

module ShouldClean
  class Simulator
    MATCHER = /^it\s*('|"|%{)/

    attr_accessor :content, :buffer

    def initialize(file_path, buffer = $stdout)
      @content = File.read(file_path)
      @buffer = buffer
    end

    def run
      return unless content.valid_encoding?

      content.each_line.each do |line|
        if line.strip.match(MATCHER)
          cleaned = Cleaner.clean(line)
          if cleaned
            buffer.puts("- #{line.strip}")
            buffer.puts("+ #{cleaned.strip}")
          end
        end
      end
    end
  end
end
