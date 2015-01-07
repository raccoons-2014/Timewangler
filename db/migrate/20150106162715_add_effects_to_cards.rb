class AddEffectsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :effect_dsl, :string
    add_column :cards, :effect_description, :string
  end
end
