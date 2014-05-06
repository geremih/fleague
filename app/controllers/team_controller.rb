class TeamController < ApplicationController
  def create

    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    user =User.find(params[:user_id])
    authorize! :create, Team
    if user.team
      user.team.destroy
    end
    team = Team.new( user_id: params[:user_id])
    authorize! :create, team
    team = user.create_team
    player_ids.each { |id|  team.player << Player.find(id) }
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
