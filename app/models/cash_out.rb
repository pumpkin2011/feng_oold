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

class CashOut < ActiveRecord::Base
  include AASM
  extend Enumerize

  acts_as_paranoid

  belongs_to :enterprise

  validates_presence_of :amount
  default_scope { order('updated_at desc') }

  enumerize :state, in: [:pending, :success, :failure, :cancel]

  aasm column: :state do
    state :pending, :initial => true
    state :success
    state :failure
    state :cancel

    event :success do
      transitions from: :pending, to: :success
    end

    event :cancel do
      transitions from: :pending, to: :cancel
    end

    event :failure do
      transitions from: :pending, to: :failure
    end
  end

  before_create do
      self.serial_inner = Time.now.strftime("%Y%m%d%H%M%S")+rand(10000).to_s
  end
end
