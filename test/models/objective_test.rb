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
require "test_helper"

class ObjectiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
