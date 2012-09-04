require 'spec_helper'

describe ShouldClean::Simulator do

  let(:spec_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'example_spec.txt') }
  let(:buffer) { StringIO.new }

  it "displays a diff of changes" do
    simulator = ShouldClean::Simulator.new(spec_file, buffer)
    simulator.run
    buffer.string.should == <<eos
- it "should do something" do
+ it "does something" do
- it 'should do something' do
+ it 'does something' do
- it %{should do something} do
+ it %{does something} do
eos
  end

  it "does not raise exception when file has invalid encoding" do
    spec_file = File.join(File.dirname(__FILE__), '..', 'fixtures', 'broken_spec.txt')
    buffer = StringIO.new
    simulator = ShouldClean::Simulator.new(spec_file, buffer)
    lambda { simulator.run }.should_not raise_exception(ArgumentError)
  end
end
