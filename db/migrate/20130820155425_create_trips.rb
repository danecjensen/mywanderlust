class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.float :current_lat
      t.float :current_lng

      t.timestamps
    end
  end
end
