# == Schema Information
#
# Table name: photos
#
#  id           :integer          not null, primary key
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  objective_id :integer
#  user_id      :integer          not null
#
# Indexes
#
#  index_photos_on_objective_id  (objective_id)
#  index_photos_on_user_id       (user_id)
#
# Foreign Keys
#
#  objective_id  (objective_id => objectives.id)
#  user_id       (user_id => users.id)
#
class Photo < ApplicationRecord
  belongs_to :objective, optional: true
  belongs_to :user
  has_one_attached :image
end
