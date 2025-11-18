class CreateObjectives < ActiveRecord::Migration[8.1]
  def change
    create_table :objectives do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :week_of
      t.date :due_date
      t.integer :priority

      t.timestamps
    end
  end
end
