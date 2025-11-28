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
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
