class RebuildPhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :photos do |t|
      t.text :description
      t.references :objective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
