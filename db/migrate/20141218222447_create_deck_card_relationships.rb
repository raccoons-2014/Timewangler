class CreateDeckCardRelationships < ActiveRecord::Migration
  def change
    create_table :deck_card_relationships do |t|
      t.references :card, index: true
      t.references :deck, index: true

      t.timestamps
    end
  end
end
