class AddNamesToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :name, :string
  end
end
