class UpdateProjectsForJournalSystem < ActiveRecord::Migration[8.1]
  def change
    change_table :projects do |t|
      t.remove :description
      t.remove :title
    end
  end
end
