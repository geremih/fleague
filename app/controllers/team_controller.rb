class TeamController < ApplicationController
  def create
    team = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    user =User.find(params[:user_id])
    user.team.players.
    
    

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
