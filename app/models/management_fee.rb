# == Schema Information
#
# Table name: management_fees
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  amount     :integer          not null
#  months     :integer          not null
#  day        :integer          not null
#  deadline   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_management_fees_on_job_id  (job_id)
#

class ManagementFee < ActiveRecord::Base
  belongs_to :job

  validates_presence_of :amount, :months, :day, :deadline
  validates :amount, :months, numericality: { only_integer: true }, allow_blank: true
  validates :day, :deadline, numericality: { only_integer: true, less_than_or_equal_to: 30 }, allow_blank: true
end
