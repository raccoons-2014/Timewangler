class CreateTimePeriods < ActiveRecord::Migration
  def change
    create_table :time_periods do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
