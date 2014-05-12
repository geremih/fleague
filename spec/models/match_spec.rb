require 'spec_helper'

describe Match do


  describe "when total players are more than 11" do  
    before do 
      @match = Match.new
      league_team1 = FactoryGirl.create(:league_team)
      11.times {FactoryGirl.create(:player, league_team: league_team1)}
      @match.team1= league_team1
      league_team2 = FactoryGirl.create(:league_team)
      11.times {FactoryGirl.create(:player, league_team: league_team2)}
      @match.team2 = league_team2
    end

    subject { @match}

    it{ should respond_to(:completed)}
    it{ should respond_to(:players)}


    it { should be_valid}
  end
  
  describe "when total players are less than 11" do

    describe "when total players are more than 11" do  
      before do 
        @match = Match.new
        league_team1 = FactoryGirl.create(:league_team)
        5.times {FactoryGirl.create(:player, league_team: league_team1)}
        @match.team1= league_team1
        league_team2 = FactoryGirl.create(:league_team)
        5.times {FactoryGirl.create(:player, league_team: league_team2)}
        @match.team2 = league_team2
      end

      subject { @match}
      it { should_not be_valid}
    end
  end
end
