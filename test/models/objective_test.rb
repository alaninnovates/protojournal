# == Schema Information
#
# Table name: objectives
#
#  id          :integer          not null, primary key
#  description :text
#  status      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  journal_id  :integer          not null
#
# Indexes
#
#  index_objectives_on_journal_id  (journal_id)
#
# Foreign Keys
#
#  journal_id  (journal_id => journals.id)
#
require "test_helper"

class ObjectiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
