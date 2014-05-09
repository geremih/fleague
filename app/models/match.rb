class Match < ActiveRecord::Base
  has_many :player_match_records
  has_many :players , through:  :player_match_records
  validate :validate_team_size
  
  def self.latest_match
    @matches = Array(Match.where(completed: nil))
    if @matches.length  == 0
      nil
    else
      @matches.max_by { |m| m.id }
    end
  end

  def validate_team_size
    errors.add(:player, "Not enough players for match") if not players.size >= 11
  end

end
