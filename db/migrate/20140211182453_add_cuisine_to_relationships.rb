class AddCuisineToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :cuisine_id, :integer
  end
end
