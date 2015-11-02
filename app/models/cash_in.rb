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

class CashIn < ActiveRecord::Base
  include AASM
  acts_as_paranoid
  belongs_to :user, polymorphic: true

  attr_accessor :username

  before_validation :set_user, unless: "username.nil?"
  validates_presence_of :user, message: '不存在', unless: "username.nil?"
  validates_presence_of :amount, :serial_inner, :channel, :state
  validates_presence_of :serial_outer, unless: "serial_outer.nil?"
  validates :amount, numericality: true, allow_blank: true
  validates_uniqueness_of :serial_inner, :serial_outer, allow_blank: true

  default_scope { order(updated_at: 'desc') }
  after_update :state_confirm

  scope :filter_by_state, -> (state) { CashIn.includes(:user).where(state.blank?? nil : "state=?", state) }

  aasm column: :state do
    state :pending, :initial => true
    state :confirmed
    state :rejected

    event :confirm do
      transitions from: :pending, to: :confirmed
      after do
        self.user.increment!(:balance, self.amount)
      end
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

    event :pend do
      transitions from: :rejected, to: :pending
    end
  end

  private
    def set_user
      user = user_type.constantize
      self.user = user.where(name: self.username).take
    end

    def state_confirm
      if self.serial_outer && self.pending?
        self.confirm!
      end
    end
end
