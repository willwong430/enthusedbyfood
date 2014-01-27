class AddFoodToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :food_id, :integer
  end
end
