require 'spec_helper'

describe Match do
  
  before do 
    @match = Match.new
    league_team1 = FactoryGirl.create(:league_team)
    11.times {FactoryGirl.create(:player, league_team: league_team1)}
    league_team2 = FactoryGirl.create(:league_team)
    11.times {FactoryGirl.create(:player, league_team: league_team2)}
    @match.team_one_id = league_team1.id
    @match.team_two_id = league_team2.id
  end

  subject { @match}

  it{ should respond_to(:completed)}
  it{ should respond_to(:players)}

  describe "when total players are 11" do
    it { should be_valid}
  end

end
