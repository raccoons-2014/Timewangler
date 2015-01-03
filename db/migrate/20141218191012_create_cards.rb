class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string   :card_type, :null => false
      t.string   :name, :null => false
      t.text     :description, :null => false
      t.integer  :strength, :null => false
      t.integer  :intelligence, :null => false
      t.integer  :charisma, :null => false
      t.references :time_period, index: true, :null => false

      t.timestamps
    end
  end
end
