class CreateReflections < ActiveRecord::Migration[8.1]
  def change
    create_table :reflections do |t|
      t.references :project, null: false, foreign_key: true
      t.date :week_of
      t.string :prompt_type
      t.text :content

      t.timestamps
    end
  end
end
