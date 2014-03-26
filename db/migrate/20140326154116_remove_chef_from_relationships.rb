class RemoveChefFromRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :chef_id, :integer
  end
end
