class AddFileToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :file, :string
  end
end
