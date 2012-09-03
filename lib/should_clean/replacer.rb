require 'fileutils'
require 'tempfile'

module ShouldClean
  class Replacer
    MATCHER = /^it /

    attr_accessor :file_path, :content

    def initialize(file_path)
      @file_path = file_path
      @content = File.read(file_path)
    end

    def run
      tmp_file = Tempfile.new('tmp.txt')

      content.each_line.each do |line|
        if line.strip.match(MATCHER)
          cleaned = Cleaner.clean(line)
          tmp_file.puts cleaned || line
        else
          tmp_file.puts line
        end
      end

      tmp_file.close

      FileUtils.mv(tmp_file, file_path)
    end
  end
end
