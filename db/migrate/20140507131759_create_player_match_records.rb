class CreatePlayerMatchRecords < ActiveRecord::Migration
  def change
    create_table :player_match_records do |t|
      t.integer :player_id
      t.integer :match_id
      t.float :score

      t.timestamps
    end
  end
end
