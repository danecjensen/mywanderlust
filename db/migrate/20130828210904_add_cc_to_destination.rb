class AddCcToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :cc, :string
  end
end
