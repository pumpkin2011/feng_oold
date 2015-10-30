# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  user_zhao_id :integer
#  name         :string           not null
#  province     :string           not null
#  city         :string           not null
#  district     :string           not null
#  address      :string           not null
#  introduction :text             not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_companies_on_city          (city)
#  index_companies_on_deleted_at    (deleted_at)
#  index_companies_on_district      (district)
#  index_companies_on_name          (name)
#  index_companies_on_province      (province)
#  index_companies_on_user_zhao_id  (user_zhao_id)
#

FactoryGirl.define do
  factory :company do
    association :user_zhao
    name '公司xxxxx'
    province '000000'
    city '111111'
    district '222222'
    address 'xxxxxxxxxxxx'
    introduction 'xxxxxxxxxxxxxx'
  end

end
