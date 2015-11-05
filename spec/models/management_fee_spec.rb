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

require 'rails_helper'

RSpec.describe ManagementFee, type: :model do
  it { should belong_to(:job) }

  it "标准数据" do
    expect(build(:management_fee)).to be_valid
  end

  describe "金额" do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount)
         .only_integer }
  end

  describe "月数" do
    it { should validate_presence_of(:months) }
    it { should validate_numericality_of(:months)
         .only_integer }
  end

  describe "每月几号" do
    it { should validate_presence_of(:day) }
    it { should validate_numericality_of(:day)
         .only_integer
         .is_less_than_or_equal_to(30)}
  end

  describe "最后期限" do
    it { should validate_presence_of(:deadline) }
    it { should validate_numericality_of(:deadline)
         .only_integer
         .is_less_than_or_equal_to(30) }
  end
end
