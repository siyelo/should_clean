require 'spec_helper'

describe ShouldClean::Conjugator do
  describe "third person present" do
    it "converts verbs" do
      ShouldClean::Conjugator.third_person_present('action').should == 'actions'
    end
  end

  describe "regular third person present conversions" do
    it "converts verb ending with 'ch'" do
      ShouldClean::Conjugator.tpp('teach').should == 'teaches'
    end

    it "converts verb ending with 's'" do
      ShouldClean::Conjugator.tpp('progress').should == 'progresses'
    end

    it "converts verb ending with 'sh'" do
      ShouldClean::Conjugator.tpp('push').should == 'pushes'
    end

    it "converts verb ending with 'x'" do
      ShouldClean::Conjugator.tpp('mix').should == 'mixes'
    end

    it "converts verb ending with 'z'" do
      ShouldClean::Conjugator.tpp('buzz').should == 'buzzes'
    end

    it "converts verb ending with 'ay'" do
      ShouldClean::Conjugator.tpp('slay').should == 'slays'
    end

    it "converts verb ending with 'ey'" do
      ShouldClean::Conjugator.tpp('prey').should == 'preys'
    end

    it "converts verb ending with 'oy'" do
      ShouldClean::Conjugator.tpp('enjoy').should == 'enjoys'
    end

    it "converts verb ending with 'uy'" do
      ShouldClean::Conjugator.tpp('buy').should == 'buys'
    end

    it "converts verb ending with consonant" do
      ShouldClean::Conjugator.tpp('action').should == 'actions'
    end

    it "converts verb ending with consonant + 'y'" do
      ShouldClean::Conjugator.tpp('modify').should == 'modifies'
    end
  end

  describe "irregular third person present conversions" do
    it "converts verb 'be'" do
      ShouldClean::Conjugator.tpp('be').should == 'is'
    end

    it "converts verb 'do'" do
      ShouldClean::Conjugator.tpp('do').should == 'does'
    end

    it "converts verb 'have'" do
      ShouldClean::Conjugator.tpp('have').should == 'has'
    end
  end

  describe "special third person present conversions" do
    it "converts verb 'rollback'" do
      ShouldClean::Conjugator.tpp('rollback').should == 'rolls back'
    end

    it "converts verb 'setup'" do
      ShouldClean::Conjugator.tpp('setup').should == 'sets up'
    end
  end
end
