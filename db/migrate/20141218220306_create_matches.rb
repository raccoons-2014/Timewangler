class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_one, references: :user
      t.integer :player_two, references: :user
      t.integer :winnter, references: :user
    end
  end
end
