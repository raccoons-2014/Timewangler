class RenamePlayerHealthToPlayerPointsInRounds < ActiveRecord::Migration
  def change
    rename_column :rounds, :player_one_health, :player_one_points
    rename_column :rounds, :player_two_health, :player_two_points
  end
end
