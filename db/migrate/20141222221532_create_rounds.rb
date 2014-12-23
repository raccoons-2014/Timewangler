class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer  :round_number

      t.integer  :player_one_health
      t.string   :player_one_hand
      t.string   :player_one_deck

      t.integer  :player_two_health
      t.string   :player_two_hand
      t.string   :player_two_deck

      t.references :game

      t.timestamps
    end
  end
end
