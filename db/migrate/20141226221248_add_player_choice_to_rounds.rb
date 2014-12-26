class AddPlayerChoiceToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :player_one_choice, :string
    add_column :rounds, :player_two_choice, :string
  end
end
