class Match < ActiveRecord::Base
  has_many :player_match_records
  has_many :players , through:  :player_match_records
  
  
  def self.latest_match
    @matches = Array(Match.where(completed: nil))
    if @matches.length  == 0
      nil
    else
      @matches.max_by { |m| m.id }
    end
  end

end
