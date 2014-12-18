class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :required
      t.string :email, :required
      t.string :password_digest

      t.timestamps
    end
  end
end
