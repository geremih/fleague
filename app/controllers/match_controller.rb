class MatchController < ApplicationController
  
  def schedule
    @remaining_players = Player.all
  end

  def create
    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    authorize! :create, Match
    match = Match.new
    player_ids.each { |id|  match.player << Player.find(id) }
    match.save
  end

end
