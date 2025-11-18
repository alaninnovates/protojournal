class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.references :objective, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :status
      t.datetime :completed_at

      t.timestamps
    end
  end
end
