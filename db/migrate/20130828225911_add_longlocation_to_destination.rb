class AddLonglocationToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
  end
end
