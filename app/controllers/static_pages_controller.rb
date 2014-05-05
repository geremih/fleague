class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @players = Player.all

    
  end
  
end
