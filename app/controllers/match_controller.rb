class MatchController < ApplicationController
  before_action :authenticate_user!

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
    
  end
  
  def index
    @matches = Match.all
  end
  

end
