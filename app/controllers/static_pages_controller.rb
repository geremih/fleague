class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home

    @user_players = current_user.team.player
    @remaining_players = Player.all  - @user_players
  end
  
end
