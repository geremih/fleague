class Player < ActiveRecord::Base
  validates :name, presence: true
  
  def init
    self.score ||=0.0
  end
  
end
