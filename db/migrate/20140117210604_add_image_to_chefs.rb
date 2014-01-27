class AddImageToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :image, :string
  end
end
