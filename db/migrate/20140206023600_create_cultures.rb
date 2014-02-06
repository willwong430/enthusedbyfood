class CreateCultures < ActiveRecord::Migration
  def change
    create_table :cultures do |t|
      t.string :name
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
