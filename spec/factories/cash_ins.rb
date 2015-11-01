# == Schema Information
#
# Table name: cash_ins
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  user_type    :string
#  amount       :decimal(10, 2)   not null
#  serial_inner :string           not null
#  serial_outer :string
#  channel      :string           not null
#  state        :string           not null
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#
# Indexes
#
#  index_cash_ins_on_channel                (channel)
#  index_cash_ins_on_deleted_at             (deleted_at)
#  index_cash_ins_on_serial_inner           (serial_inner) UNIQUE
#  index_cash_ins_on_serial_outer           (serial_outer) UNIQUE
#  index_cash_ins_on_state                  (state)
#  index_cash_ins_on_user_type_and_user_id  (user_type,user_id)
#

FactoryGirl.define do
  factory :cash_in do
    association :user, factory: :user_zhao
    amount "100000"
    serial_inner "00001111"
    serial_outer "11110000"
    channel "offline"
    state "pending"
    note "This is a test note"
  end

end
