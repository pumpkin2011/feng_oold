# == Schema Information
#
# Table name: banks
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  published_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Bank, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
