# == Schema Information
#
# Table name: photo_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo_id   :integer          not null
#  tag_id     :integer          not null
#
# Indexes
#
#  index_photo_tags_on_photo_id  (photo_id)
#  index_photo_tags_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  photo_id  (photo_id => photos.id)
#  tag_id    (tag_id => tags.id)
#
require "test_helper"

class PhotoTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
