# == Schema Information
#
# Table name: reflections
#
#  id          :integer          not null, primary key
#  content     :text
#  prompt_type :string
#  week_of     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#
# Indexes
#
#  index_reflections_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Reflection < ApplicationRecord
  belongs_to :project

  validates :content, presence: true
end
