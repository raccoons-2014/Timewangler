class CreateHeroCards < ActiveRecord::Migration
  def change
    create_table :hero_cards do |t|
      t.string :name
      t.references :time_period, index: true
      t.text :description
      t.integer :strength
      t.integer :intelligence
      t.integer :charisma

      t.timestamps
    end
  end
end
