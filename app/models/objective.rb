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
class Objective < ApplicationRecord
  belongs_to :journal
  has_many :photos, dependent: :destroy
end
