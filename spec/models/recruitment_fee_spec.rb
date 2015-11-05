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

require 'rails_helper'

RSpec.describe RecruitmentFee, type: :model do
  it { should belong_to(:job) }

  it "标准数据" do
    expect(build(:recruitment_fee)).to be_valid
  end

  describe "性别" do
    it { should validate_presence_of(:gender) }
    it { should enumerize(:gender).in(:male, :female) }
  end

  describe "天数" do
    it { should validate_presence_of(:days) }
    it { should validate_numericality_of(:days)
         .only_integer}
  end

  describe "金额" do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount)
         .only_integer}
  end

  describe "最晚多少天" do
    it { should validate_presence_of(:deadline) }
    it { should validate_numericality_of(:deadline)
         .only_integer}
  end
end
