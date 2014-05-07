class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.boolean :completed

      t.timestamps
    end
  end
end
