class TeamController < ApplicationController

  before_action :authenticate_user!
  def create
    player_ids = params[:team].split(",").collect{ |s| s.to_i }
    #TODO: Check team length
    #TODO: Check correct format of the input
    user =User.find(current_user.id)
    authorize! :create, Team
    if user.team_for_match_id params[:match_id]
      user.team_for_match_id(params[:match_id]).destroy
    end
    team = Team.new( user_id: params[:user_id] , match_id: params[:match_id])
    authorize! :create, team
    team = user.teams.create
    player_ids.each { |id|  team.players << Player.find(id) }
    team.match_id = params[:match_id].to_i
    team.save
    if not user.save
      flash[:notice] = "Failed"
    end
  end

  def new
    
    @match_id = params[:match_id]
    if not @match_id and Match.latest_match.id
      redirect_to new_match_team_path(Match.latest_match.id)
      return
    end


    @match_id = @match_id.to_i
    @match = Match.find(@match_id)

    if @match.completed
      redirect_to team_path(current_user.team_for_match_id @match_id)
      return
    end
    @team = current_user.team_for_match_id @match_id
    if @team
      @user_players = Array(@team.players)
    else
      @user_players = []
    end

    @remaining_players = @match.players - @user_players
  end

  def edit
  end

  def show
    @team = Team.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  def matchup
    
  end


  
end
