require 'spec_helper'

describe ShouldClean::Cleaner do

  describe "normal conversion from future to present tense" do
    it "converts spec defined with double quotes" do
      ShouldClean.clean('it "should action something"').
        should == 'it "actions something"'
    end

    it %{converts spec defined with percentage} do
      ShouldClean.clean('it %{should action something}').
        should == 'it %{actions something}'
    end

    it 'converts spec defined with single quotes' do
      ShouldClean.clean("it 'should action something'").
        should == "it 'actions something'"
    end

    it "converts spec with auxilliary verb 'do' to 'does'" do
      ShouldClean.clean('it "should do something"').
        should == 'it "does something"'
    end
  end

  describe "conversion of should variations" do
    it "converts 'should not action' to 'does not action'" do
      ShouldClean.clean('it "should not action"').
        should == 'it "does not action"'
    end

    it "converts 'shouldn't action' to 'does not action'" do
      ShouldClean.clean('it "shouldn\'t action"').
        should == 'it "does not action"'
    end

    it "converts 'should be able to action' to 'actions'" do
      ShouldClean.clean('it "should be able to action"').
        should == 'it "actions"'
    end
  end
end
