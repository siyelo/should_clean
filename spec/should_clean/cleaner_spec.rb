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

  describe "conversion of adverbs" do
    it "converts 'should correctly calculate' to 'correctly calculates'" do
      ShouldClean.clean('it "should correctly calculate"').
        should == 'it "correctly calculates"'
    end

    it "converts 'should auto generate' to 'auto generate'" do
      ShouldClean.clean('it "should auto generate"').
        should == 'it "auto generates"'
    end

    it "converts 'should automatically generate' to 'automatically generates'" do
      ShouldClean.clean('it "should automatically generate"').
        should == 'it "automatically generates"'
    end

    it "converts 'should only list' to 'only lists'" do
      ShouldClean.clean('it "should only list"').
        should == 'it "only lists"'
    end

    it "converts 'should by default have' to 'by default has'" do
      ShouldClean.clean('it "should by default have"').
        should == 'it "by default has"'
    end
  end
end
