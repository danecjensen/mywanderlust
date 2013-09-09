class AddUrlToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :url, :string
  end
end
