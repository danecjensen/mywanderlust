class AddUserIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :user_id, :integer
  end
end
