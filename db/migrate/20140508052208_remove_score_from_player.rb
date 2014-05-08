class RemoveScoreFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :score, :integer
  end
end
