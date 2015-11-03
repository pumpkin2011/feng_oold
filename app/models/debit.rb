# == Schema Information
#
# Table name: debits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  user_type  :string
#  bank_id    :integer
#  name       :string           not null
#  account    :string           not null
#  deposit    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_debits_on_account                (account)
#  index_debits_on_bank_id                (bank_id)
#  index_debits_on_name                   (name)
#  index_debits_on_user_type_and_user_id  (user_type,user_id)
#

class Debit < ActiveRecord::Base
  belongs_to :user, polymorphic: true
  belongs_to :bank

  validates_presence_of :name, :account, :deposit
  validates :name, length: { in: 2..10 }, allow_blank: true
  validates :account, length: { in: 16..20 }, allow_blank: true
  validates :deposit, length: { in: 2..20 }, allow_blank: true
end
