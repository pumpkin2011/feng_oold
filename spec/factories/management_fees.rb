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

FactoryGirl.define do
  factory :management_fee do
    association :job
    amount 1000
    months 5
    day 15
    deadline 10
  end

end
