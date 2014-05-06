class TeamController < ApplicationController
  def create
    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    user =User.find(params[:user_id])
    if user.team
      user.team.destroy
    end
    team  = Team.new
    player_ids.each { |id|  team.player << Player.find(id) }
    user.team = team
    user.save

  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
