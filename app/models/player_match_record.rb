class PlayerMatchRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  validates_uniqueness_of :player_id, scope: :match_id

end
