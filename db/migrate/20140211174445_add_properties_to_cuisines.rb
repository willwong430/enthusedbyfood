class AddPropertiesToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines, :properties, :text
  end
end
