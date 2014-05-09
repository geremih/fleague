class AddNameToLeagueTeam < ActiveRecord::Migration
  def change
    add_column :league_teams, :name, :string
  end
end
