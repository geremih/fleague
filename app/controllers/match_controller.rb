class MatchController < ApplicationController
  

  def create
    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    authorize! :create, Match
    match = Match.new
    player_ids.each { |id|  match.players << Player.find(id) }
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
    match_id = params[:id]
    @scores = []
    for player in  Match.find(match_id).players
      PlayerTeamRecord.find_by()
      player.score = params[player.id.to_s].to_i
      @scores << player.score
    end
    
  end
  
  def index
    @matches = Match.all
  end
  

end
