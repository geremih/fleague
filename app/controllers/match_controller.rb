class MatchController < ApplicationController
  before_action :authenticate_user!
  layout Proc.new{ ['index', 'new', 'edit'].include?(action_name) ? 'dashboard' : 'application' }

  def create
    authorize! :create, Match
    team1_id = params[:team1].to_i
    team2_id = params[:team2].to_i
    match = Match.new
    match.team1 = LeagueTeam.find(team1_id)
    match.team2 = LeagueTeam.find(team2_id)
    if !match.save
      flash[:alert]= match.errors.inspect
    end
    if match.errors.empty?
      flash[:notice] = "Match scheduled"
      redirect_to match_index_path
    else
      flash[:alert] = "Couldn't schedule."
      redirect_to new_match_path
    end

  end

  def new
    authorize! :create, Match
    @remaining_players = Player.all
  end

  def edit
    authorize! :update , Match
    @match = Match.find(params[:id])
    @players = @match.players

  end

  def show
    @match = Match.find(params[:id].to_i)
  end
  
  def update
    authorize! :update , Match
    match = Match.find(params[:id])
    @scores = []
    @records = []
    for player in  match.players
      record = PlayerMatchRecord.find_by match_id: match.id ,  player_id: player.id
      record.score = params[player.id.to_s].to_i < 100 ? params[player.id.to_s].to_i : 100
      record.save
      @records << record
    end
    match.completed = true
    if match.save
      flash[:notice] = "Match updated"
    else
      flash[:alert] = "Some error occured, please try again"
    end
    redirect_to match_index_url
  end
  
  def index
    authorize! :update , Match
    @matches = Match.all
  end
  

end
