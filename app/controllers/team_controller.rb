class TeamController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize! :create, Team
    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    user =User.find(current_user.id)
    teams = current_user.teams.where(match_id: params[:match_id].to_i)
    if not  teams.empty?
      teams.destroy_all
    end
    team = Team.new( user_id: current_user.id , match_id: params[:match_id])
    authorize! :create, team
    team = user.teams.create
    player_ids.each { |id|  team.players << Player.find(id) }
    team.match_id = params[:match_id].to_i
    team.save
    user.save
    if  team.errors.empty?
      flash[:notice] = "Team updated"
    else
      flash[:alert] = "Couldn't create team"
    end
    redirect_to new_match_team_url(match_id: params[:match_id].to_i)
end


def new
  authorize! :create, Team
  match_id = params[:match_id]
  if not match_id or not Match.exists? match_id.to_i
    redirect_to pages_home_path
    return 
  end
  @match = Match.find(match_id.to_i)
  if @match.completed
    redirect_to team_path(current_user.team_for_match_id @match.id)
    return
  end
  team = current_user.team_for_match_id @match.id
  if team
    @user_players = Array(team.players)
  else
    @user_players = []
  end
  @remaining_players = @match.players - @user_players

end

def edit
end

def show
  authorize! :read , Team
  @team = Team.find(params[:id])
end

def update
end

def destroy
end

def matchup
  
end



end
