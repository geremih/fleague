class Player < ActiveRecord::Base
  belongs_to :league_team
  has_and_belongs_to_many :team
  has_many :player_team_records
  has_many :teams, through: :player_team_records
  has_many :player_match_records
  has_many :matches , through:  :player_match_records

  validates :name, presence: true

  
  def score
    Array(PlayerMatchRecord.where(player_id: self.id)).inject(0) do |acc, p| 
      if Match.find(p.match_id).completed
        acc + p.score
      else
        acc
      end
    end
  end

  def score_in_match match_id
    if Match.find(match_id).completed
      PlayerMatchRecord.where( player_id: self.id , match_id: match_id).first.score
    else
      0
    end

  end
end
