class MatchController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize! :create, Match
    team1_id = params[:team1].to_i
    team2_id = params[:team2].to_i
    match = Match.new
    match.team_one_id = team1_id
    match.team_two_id = team2_id
    LeagueTeam.find(team1_id).players.each {|p| match.players << p  }
    LeagueTeam.find(team2_id).players.each {|p| match.players << p  }
    match.save
  end

  def new
    @remaining_players = Player.all
  end

  def edit
    @match = Match.find(params[:id])
    @players = @match.players

  end
  
  def update
    match = Match.find(params[:id])
    @scores = []
    @records = []
    for player in  match.players
      record = PlayerMatchRecord.find_by match_id: match.id ,  player_id: player.id
      record.score = params[player.id.to_s].to_i
      record.save
      @records << record
    end
    match.completed = true
    match.save
    redirect_to match_index_url
  end
  
  def index
    @matches = Match.all
  end
  

end
