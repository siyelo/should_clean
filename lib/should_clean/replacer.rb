require 'fileutils'
require 'tempfile'

module ShouldClean
  class Replacer
    attr_accessor :file_path, :content

    def initialize(file_path)
      @file_path = file_path
      @content = File.read(file_path)
    end

    def run
      return unless content.valid_encoding?

      tmp_file = Tempfile.new('tmp.txt')

      content.each_line.each do |line|
        cleaned = Cleaner.clean(line)
        tmp_file.puts cleaned || line
      end

      tmp_file.close

      FileUtils.mv(tmp_file, file_path)
    end
  end
end
