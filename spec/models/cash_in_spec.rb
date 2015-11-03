# == Schema Information
#
# Table name: cash_ins
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  amount        :decimal(10, 2)   not null
#  serial_inner  :string           not null
#  serial_outer  :string
#  channel       :string           not null
#  state         :string           not null
#  note          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#
# Indexes
#
#  index_cash_ins_on_channel        (channel)
#  index_cash_ins_on_deleted_at     (deleted_at)
#  index_cash_ins_on_enterprise_id  (enterprise_id)
#  index_cash_ins_on_serial_inner   (serial_inner) UNIQUE
#  index_cash_ins_on_serial_outer   (serial_outer) UNIQUE
#  index_cash_ins_on_state          (state)
#

require 'rails_helper'

RSpec.describe CashIn, type: :model do
  it {should belong_to(:enterprise) }

  it "标准数据" do
    expect(build(:cash_in)).to be_valid
  end

  describe "金额" do
    it { should validate_numericality_of(:amount) }
  end

  describe "银行流水号" do
    it { should validate_presence_of(:serial_inner) }
  end

  describe "内部流水号和渠道" do
    # it { should validate_presence_of(:serial_outer) }
    it { should validate_presence_of(:channel) }
  end

  # describe "状态" do
  #   it do
  #     record1 = create(:cash_in)
  #     record2 = create(:cash_in)
  #     expect(record1.state).to eq "confirming"
  #     expect(record2.state).to eq "confirming"
  #     expect(record1.confirming?).to eq true
  #     expect(record1.success?).to eq false
  #     record1.success
  #     expect(record1.success?).to eq true
  #     record2.fail
  #     expect(record2.fail?).to eq true
  #   end
  # end
end
