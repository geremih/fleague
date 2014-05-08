class Team < ActiveRecord::Base
  has_many :player_team_records
  has_many :players , through: :player_team_records
  belongs_to :user
  belongs_to :match
  validate :validate_team_size
  def score
    if not self.match_id
      return 0
    end
    if Match.find(self.match_id).completed
      self.players.inject(0) do |acc , p|
        acc + PlayerMatchRecord.where(player_id: p.id , match_id: self.match_id).first.score
      end
    else
      0
    end
  end

  def validate_team_size
    errors.add(:player, "team not of 11 players") if not players.size ==11
  end
end

