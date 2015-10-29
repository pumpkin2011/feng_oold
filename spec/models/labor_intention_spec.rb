# == Schema Information
#
# Table name: labor_intentions
#
#  id         :integer          not null, primary key
#  labor_id   :integer
#  salary     :string
#  province   :string
#  city       :string
#  district   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_labor_intentions_on_city      (city)
#  index_labor_intentions_on_district  (district)
#  index_labor_intentions_on_labor_id  (labor_id)
#  index_labor_intentions_on_province  (province)
#  index_labor_intentions_on_salary    (salary)
#

require 'rails_helper'

RSpec.describe LaborIntention, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
