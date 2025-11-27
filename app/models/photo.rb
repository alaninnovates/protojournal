# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Photo < ApplicationRecord
  has_one_attached :image
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags

  belongs_to :user, optional: true
  belongs_to :objective, optional: true
end
