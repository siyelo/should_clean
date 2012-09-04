require 'spec_helper'

describe "Example" do
  describe "namespace" do
    it { should == "namespace" }

    it do
      should == "namespace"
    end

    it "should create some (should another)" do
      1.should == 1
    end

    it "should do something" do
      1.should == 1
    end

    it 'should do something' do
      italian = "hi"
      italian.should == "hi"
    end

    it %{should do something} do
      "it".should == "it"
    end
  end
end
