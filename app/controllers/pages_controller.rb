class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @teams = current_user.teams
    @users = User.all.sort{ |a,b|  b.score - a.score}
    @upcoming_matches = Match.where(completed: nil)
  end
end
