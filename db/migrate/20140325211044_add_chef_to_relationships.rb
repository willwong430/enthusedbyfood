class AddChefToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :chef_id, :integer
  end
end
