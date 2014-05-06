class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    if current_user.team
      @user_players = current_user.team.player
    else
      @user_players = []
    end
    @remaining_players = Player.all  - @user_players
  end

  def dashboard
  end
  
end
