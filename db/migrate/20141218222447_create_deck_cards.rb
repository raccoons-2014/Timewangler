class CreateDeckCards < ActiveRecord::Migration
  def change
    create_table :deck_cards do |t|
      t.references :hero_card, index: true
      t.references :deck, index: true

      t.timestamps
    end
  end
end
