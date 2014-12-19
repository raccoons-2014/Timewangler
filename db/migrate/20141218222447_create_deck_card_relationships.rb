class CreateDeckCardRelationships < ActiveRecord::Migration
  def change
    create_table :deck_card_relationships do |t|
      t.references :hero_card, index: true
      t.references :deck, index: true

      t.timestamps
    end
  end
end
