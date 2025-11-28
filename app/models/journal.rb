# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  summary    :text
#  week_end   :date
#  week_start :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#
# Indexes
#
#  index_journals_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Journal < ApplicationRecord
  belongs_to :project
  has_one :reflection, dependent: :destroy
  has_many :objectives, dependent: :destroy
end
