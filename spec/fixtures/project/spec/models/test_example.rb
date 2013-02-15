require 'spec_helper'

describe "Example" do
  describe "namespace" do
    it { should == "namespace" }

    it do
      should == "namespace"
    end

    it "creates some (should another)" do
      1.should == 1
    end

    it "does something" do
      1.should == 1
    end

    it 'does something' do
      italian = "hi"
      italian.should == "hi"
    end

    it %{does something} do
      "it".should == "it"
    end
  end
end
