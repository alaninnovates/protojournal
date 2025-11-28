class RemoveOldTables < ActiveRecord::Migration[8.1]
  def change
    drop_table :tasks, if_exists: true
    drop_table :tags, if_exists: true
    drop_table :photo_tags, if_exists: true
    drop_table :photos, if_exists: true
  end
end
