class RebuildReflections < ActiveRecord::Migration[8.1]
  def change
    drop_table :reflections, if_exists: true

    create_table :reflections do |t|
      t.text :challenges
      t.text :supports
      t.text :next_steps
      t.references :journal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
