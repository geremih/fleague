class Player < ActiveRecord::Base
  has_and_belongs_to_many :team
  has_many :player_team_records
  has_many :teams, through: :player_team_records
  has_many :player_match_records
  has_many :matches , through:  :player_match_records
  validates :name, presence: true
  
  def init
    self.score ||=0.0
  end
  
end
