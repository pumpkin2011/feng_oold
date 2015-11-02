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

require 'rails_helper'

RSpec.describe Debit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
