class AddAddedToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :added_by, :string
    add_column :destinations, :added_by_photo_url, :string
  end
end
