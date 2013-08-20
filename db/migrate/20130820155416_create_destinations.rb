class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.integer :trip_id
      t.string :name
      t.string :photo_url
      t.string :address
      t.string :cross_street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.float :lat
      t.float :lng
      t.integer :distance

      t.timestamps
    end
  end
end
