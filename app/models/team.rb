class Team < ActiveRecord::Base
  has_many :player_team_records
  has_many :players , through: :player_team_records
  belongs_to :user
  belongs_to :match
  
  def score
    if Match.find(self.match_id).completed
      self.players.inject do |acc , p|
        acc + PlayerMatchRecord.where(player_id: self.id , match_id: self.match_id).score
      end
    end
  end
end

