class AddLeagueTeamIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :league_team_id, :integer
  end
end
