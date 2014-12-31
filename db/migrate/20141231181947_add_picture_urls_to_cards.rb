class AddPictureUrlsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :picture_url, :string
  end
end
