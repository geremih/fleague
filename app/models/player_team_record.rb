class PlayerTeamRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  validates_uniqueness_of :player_id, scope: :team_id
  
end
