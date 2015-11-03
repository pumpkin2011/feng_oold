# == Schema Information
#
# Table name: cash_outs
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  amount        :decimal(10, 2)   not null
#  serial_inner  :string           not null
#  serial_outer  :string
#  state         :string           not null
#  note          :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cash_outs_on_enterprise_id  (enterprise_id)
#

require 'rails_helper'

RSpec.describe CashOut, type: :model do
  it { should belong_to(:enterprise) }
  it "标准数据" do
    expect(build(:cash_out)).to be_valid
  end

  describe "提现金额" do
    it { should validate_presence_of(:amount)}
  end

end
