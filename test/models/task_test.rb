# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  completed_at :datetime
#  description  :text
#  status       :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  objective_id :integer          not null
#
# Indexes
#
#  index_tasks_on_objective_id  (objective_id)
#
# Foreign Keys
#
#  objective_id  (objective_id => objectives.id)
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
