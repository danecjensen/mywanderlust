class AddFoursquareurlsToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :fsq_prefix_url, :string
    add_column :destinations, :fsq_suffix_url, :string
  end
end
