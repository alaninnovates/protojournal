class PhotosObjectiveOptional < ActiveRecord::Migration[8.1]
  def change
    change_column_null :photos, :objective_id, true
  end
end
