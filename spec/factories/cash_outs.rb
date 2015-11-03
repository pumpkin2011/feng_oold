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

FactoryGirl.define do
  factory :cash_out do
    association :enterprise
    amount "9.99"
    serial_inner "2015110234351446448073"
  end

end
