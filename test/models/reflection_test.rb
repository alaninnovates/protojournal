# == Schema Information
#
# Table name: reflections
#
#  id         :integer          not null, primary key
#  challenges :text
#  next_steps :text
#  supports   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  journal_id :integer          not null
#
# Indexes
#
#  index_reflections_on_journal_id  (journal_id)
#
# Foreign Keys
#
#  journal_id  (journal_id => journals.id)
#
require "test_helper"

class ReflectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
