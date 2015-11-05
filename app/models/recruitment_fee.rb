# == Schema Information
#
# Table name: recruitment_fees
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  gender     :string           not null
#  days       :integer          not null
#  amount     :integer          not null
#  deadline   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_recruitment_fees_on_job_id  (job_id)
#

class RecruitmentFee < ActiveRecord::Base
  extend Enumerize
  belongs_to :job

  enumerize :gender, in: [:male, :female]

  validates_presence_of :gender, :days, :amount, :deadline
  validates :days, :amount, :deadline, numericality: { only_integer: true }, allow_blank: true
end
