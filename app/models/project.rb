# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  status      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
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
  belongs_to :user
  has_many :reflections, dependent: :destroy
  has_many :objectives, dependent: :destroy

  validates :name, presence: true
  validates :title, presence: true
end
