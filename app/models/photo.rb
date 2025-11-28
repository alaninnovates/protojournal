# == Schema Information
#
# Table name: photos
#
#  id           :integer          not null, primary key
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  objective_id :integer          not null
#
# Indexes
#
#  index_photos_on_objective_id  (objective_id)
#
# Foreign Keys
#
#  objective_id  (objective_id => objectives.id)
#
class Photo < ApplicationRecord
  belongs_to :objective, optional: true
  belongs_to :user
  has_one_attached :image
end
