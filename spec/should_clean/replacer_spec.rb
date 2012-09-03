require 'spec_helper'

describe ShouldClean::Replacer do

  let(:spec_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'example_spec.txt') }
  let(:correct_spec_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'example_correct_spec.txt') }
  let(:buffer) { StringIO.new }

  describe "dry run" do
    it "displays a diff of changes" do
      file = File.open(spec_file, 'r+')
      ShouldClean::Replacer.diff(file, buffer)
      buffer.string.should == <<eos
- it "should do something" do
+ it "does something" do
- it 'should do something' do
+ it 'does something' do
- it %{should do something} do
+ it %{does something} do
eos
    end
  end

  describe "real run" do
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
      ShouldClean::Replacer.replace!(@file)
      FileUtils.compare_file(spec_file, correct_spec_file).should be_true
    end
  end
end
