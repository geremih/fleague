class Match < ActiveRecord::Base
  has_many :player_match_records
  has_many :players , through:  :player_match_records

  before_save :default_values
  def default_values
    self.completed ||= false
  end

end
