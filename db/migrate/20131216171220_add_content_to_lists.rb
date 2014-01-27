class AddContentToLists < ActiveRecord::Migration
  def change
    add_column :lists, :content, :string
  end
end
