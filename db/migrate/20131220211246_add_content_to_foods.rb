class AddContentToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :content, :string
  end
end
