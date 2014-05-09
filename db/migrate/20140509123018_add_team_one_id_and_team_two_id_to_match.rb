class AddTeamOneIdAndTeamTwoIdToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :team_one_id, :integer
    add_column :matches, :team_two_id, :integer
  end
end
