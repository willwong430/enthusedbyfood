class AddImageToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines, :image, :string
  end
end
