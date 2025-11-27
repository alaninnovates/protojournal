class RemoveTitleFromProjectsAndMakeNameRequired < ActiveRecord::Migration[8.1]
  def change
    remove_column :projects, :title, :string
    change_column_null :projects, :name, false
  end
end
