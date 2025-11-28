# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Project < ApplicationRecord
  has_many :journals, dependent: :destroy
  validates :name, presence: true
end
