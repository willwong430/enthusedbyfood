class DropChefsTable < ActiveRecord::Migration
  def up
    drop_table :chefs
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
