class Team < ActiveRecord::Base
  has_many :player_team_records
  has_many :players , through: :player_team_records
  belongs_to :user
  
end
