class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_one :team
  Roles = [:admin , :default]

  def init
    self.role ||= :default
  end
  def is?( requested_role)
    self.role  == requested_role.to_s
  end
    
end
