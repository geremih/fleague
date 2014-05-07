class CreateMatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_players ,id: false do |t|
      t.belongs_to :match
      t.belongs_to :player
    end
  end
end
