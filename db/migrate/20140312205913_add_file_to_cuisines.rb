class AddFileToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines, :file, :string
  end
end
