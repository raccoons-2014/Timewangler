class UpdateCardsTable < ActiveRecord::Migration
  def change
    remove_reference :cards, :time_period, index:true
    add_column :cards, :time_period, :string
  end
end
