require 'spec_helper'

describe ShouldClean::Replacer do

  let(:spec_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'example_spec.txt') }
  let(:correct_spec_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'example_correct_spec.txt') }

  before :each do
    @file = File.open(spec_file, 'r+')
    @original_content = @file.read
    @file.rewind
  end

  after :each do
    File.open(spec_file, 'w') do |file|
      file.puts @original_content
    end
  end

  it "writes changes to the file" do
    replacer = ShouldClean::Replacer.new(spec_file)
    replacer.run
    FileUtils.compare_file(spec_file, correct_spec_file).should be_true
  end

  it "does not raise exception when file has invalid encoding" do
    spec_file = File.join(File.dirname(__FILE__), '..', 'fixtures', 'broken_spec.txt')
    replacer = ShouldClean::Replacer.new(spec_file)
    lambda { replacer.run }.should_not raise_exception(ArgumentError)
  end
end
