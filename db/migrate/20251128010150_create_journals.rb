class CreateJournals < ActiveRecord::Migration[8.1]
  def change
    create_table :journals do |t|
      t.date :week_start
      t.date :week_end
      t.text :summary
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
