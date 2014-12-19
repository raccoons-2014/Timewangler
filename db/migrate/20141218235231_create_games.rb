class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player_one
      t.references :player_two
      t.references :winner

      t.timestamps
    end
  end
end
