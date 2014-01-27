class AddRatingIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :rating_id, :integer
  end
end
