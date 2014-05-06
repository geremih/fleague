class Player < ActiveRecord::Base
  has_and_belongs_to :team
  validates :name, presence: true
  
  def init
    self.score ||=0.0
  end
  
end
