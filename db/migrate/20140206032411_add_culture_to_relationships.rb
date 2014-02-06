class AddCultureToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :culture_id, :integer
  end
end
