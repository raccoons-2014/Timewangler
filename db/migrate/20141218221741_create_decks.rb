class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :user, index: true, :null => false

      t.timestamps
    end
  end
end
