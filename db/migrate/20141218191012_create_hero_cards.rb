class CreateHeroCards < ActiveRecord::Migration
  def change
    create_table :hero_cards do |t|
      t.string :name, :null => false
      t.references :time_period, index: true, :null => false
      t.text :description, :null => false
      t.integer :strength, :null => false
      t.integer :intelligence, :null => false
      t.integer :charisma, :null => false

      t.timestamps
    end
  end
end
