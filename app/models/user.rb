class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :teams
  Roles = [:admin , :default]

  before_save :default_values
  def default_values
    self.role ||= :default
  end

  def is?( requested_role)
    self.role  == requested_role.to_s
  end

  def score
    self.teams.inject(0) { |acc, t| acc + t.score}
  end

  def team_for_match_id( match_id)
    self.teams.where( match_id: match_id).first
  end
    
end
