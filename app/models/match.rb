class Match < ActiveRecord::Base
  has_and_belongs_to_many :player

  before_save :default_values
  def default_values
    self.completed ||= false
  end

end
