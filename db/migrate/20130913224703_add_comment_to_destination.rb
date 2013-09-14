class AddCommentToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :comment, :string
  end
end
