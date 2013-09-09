class AddDirectionsToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :directions, :string
  end
end
