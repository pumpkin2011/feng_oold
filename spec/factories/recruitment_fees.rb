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

FactoryGirl.define do
  factory :recruitment_fee do
    association :job
    gender "male"
    days 10
    amount 1000
    deadline 10
  end

end
