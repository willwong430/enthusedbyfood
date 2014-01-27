class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :activity_id
      t.string :who_with
      t.string :what_eaten
      t.string :where_at
      t.datetime :when_time
      t.string :why_eat
      t.integer :how_good

      t.timestamps
    end
    add_index :details, :activity_id
  end
end
