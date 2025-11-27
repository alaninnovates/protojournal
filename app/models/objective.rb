# == Schema Information
#
# Table name: objectives
#
#  id          :integer          not null, primary key
#  description :text
#  due_date    :date
#  priority    :integer
#  title       :string
#  week_of     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#
# Indexes
#
#  index_objectives_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Objective < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
