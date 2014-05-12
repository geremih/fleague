class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @teams = current_user.teams.select {|t| Match.find(t.match_id).completed}
    @users = Kaminari.paginate_array( User.all.sort{ |a,b|  b.score - a.score}).page(params[:page]).per 10
    @upcoming_matches = Match.where(completed: nil)
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
