class UpdateCardsTable < ActiveRecord::Migration
  def change
    remove_column :cards, :time_period, :integer
    add_column :cards, :time_period, :string
  end
end
