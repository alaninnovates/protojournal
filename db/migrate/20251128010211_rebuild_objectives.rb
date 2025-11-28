class RebuildObjectives < ActiveRecord::Migration[8.1]
  def change
    drop_table :objectives, if_exists: true

    create_table :objectives do |t|
      t.text :description
      t.text :status
      t.references :journal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
