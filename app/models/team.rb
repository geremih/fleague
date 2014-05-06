class Team < ActiveRecord::Base
  has_and_belongs_to_many :player
  belongs_to :user
  
end
