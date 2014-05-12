class MatchController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize! :create, Match
    team1_id = params[:team1].to_i
    team2_id = params[:team2].to_i
    match = Match.new
    match.team_one_id = team1_id
    match.team_two_id = team2_id
    LeagueTeam.find(team1_id).players.each {|p| match.players << p  }
    LeagueTeam.find(team2_id).players.each {|p| match.players << p  }
    if !match.save
      flash[:alert]= match.errors.inspect
    end

    respond_to do |format|
      if match.errors.empty?
        format.html
        format.js { render :json => {:status => :success}}
      else
        format.html
        format.js { render :json => {:status => :error}}
      end
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
      record.score = params[player.id.to_s].to_i
      record.save
      @records << record
    end
    match.completed = true
    match.save
    redirect_to match_index_url
  end
  
  def index
    authorize! :update , Match
    @matches = Match.all
  end
  

end
