class AddUrlToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :s3_url, :string
  end
end
