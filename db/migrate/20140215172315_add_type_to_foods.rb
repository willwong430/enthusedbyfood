class AddTypeToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :product_type_id, :integer
  end
end
