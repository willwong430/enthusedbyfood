class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :user_profile, index: true

      t.timestamps
    end
  end
end
