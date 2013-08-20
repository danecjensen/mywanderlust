class AddWebstringToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :webstring, :string
  end
end
