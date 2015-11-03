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

class CashIn < ActiveRecord::Base
  include AASM
  acts_as_paranoid
  belongs_to :enterprise

  attr_accessor :enterprise_name

  before_validation :set_enterprise, unless: "enterprise_name.nil?"
  validates_presence_of :enterprise, message: '不存在', unless: "enterprise_name.nil?"
  validates_presence_of :amount, :serial_inner, :channel, :state
  validates_presence_of :serial_outer, unless: "serial_outer.nil?"
  validates :amount, numericality: true, allow_blank: true
  validates_uniqueness_of :serial_inner, :serial_outer, allow_blank: true

  default_scope { order(updated_at: 'desc') }
  after_update :state_confirm

  aasm column: :state do
    state :pending, :initial => true
    state :confirmed
    state :rejected

    event :confirm do
      transitions from: :pending, to: :confirmed
      after do
        self.enterprise.increment!(:balance, self.amount)
      end
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

    event :pend do
      transitions from: :rejected, to: :pending
    end
  end

  def self.filter_by_state(state, user_type)
    self.includes(:enterprise).where(state.blank?? nil : "state=?", state)
  end

  private
    def set_enterprise
      self.enterprise = Enterprise.where(name: self.enterprise_name).take
    end

    def state_confirm
      if self.serial_outer && self.pending?
        self.confirm!
      end
    end
end
