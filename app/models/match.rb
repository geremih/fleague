class Match < ActiveRecord::Base
  has_many :player_match_records
  has_many :players , through:  :player_match_records
  validate :validate_team_size , :validate_teams_are_different
  validates :completed , inclusion: { in: [nil , true] }
  
  def self.latest_match
    @matches = Array(Match.where(completed: nil))
    if @matches.length  == 0
      nil
    else
      @matches.max_by { |m| m.id }
    end
  end

  
  
  def team1
    if self.team_one_id
      LeagueTeam.find( self.team_one_id)
    end
  end

  def team1=(team)
    if self.team_one_id
      raise "Can't replace team'"
    else
      self.team_one_id = team.id
      team.players.each {|p| self.players << p  }
    end
    
  end


  def team2
    if self.team_two_id
      LeagueTeam.find( self.team_two_id)
    end
  end

  def team2=(team)
    if self.team_two_id
      raise "Can't replace team'"
    else
      self.team_two_id = team.id
      team.players.each {|p| self.players << p  }
    end
  end

  def validate_teams_are_different
    if team1 == team2
      errors.add(:team, "The two teams should be different (#{team1.id} , #{team2.id} ")
    end
  end
  
  def validate_team_size
    errors.add(:player, "Not enough players for match") if not players.size >= 11
  end
  

end
