class AddTitleToProjects < ActiveRecord::Migration[8.1]
  def change
    add_column :projects, :title, :string
  end
end
