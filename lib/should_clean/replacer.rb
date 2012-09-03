require 'fileutils'
require 'tempfile'

module ShouldClean
  class Replacer
    MATCHER = /^it /

    def self.diff(file, buffer = $stdout)
      file.readlines.each do |line|
        if line.strip.match(MATCHER)
          cleaned = ShouldClean::Cleaner.clean(line)
          if cleaned
            buffer.puts("- #{line.strip}")
            buffer.puts("+ #{cleaned.strip}")
          end
        end
      end
    end

    def self.replace!(file)
      tmp_file = Tempfile.new('tmp.txt')
      file.each_line.each do |line|
        if line.strip.match(MATCHER)
          cleaned = ShouldClean::Cleaner.clean(line)
          tmp_file.puts cleaned || line
        else
          tmp_file.puts line
        end
      end
      tmp_file.close

      FileUtils.mv(tmp_file, file.path)
    end
  end
end
