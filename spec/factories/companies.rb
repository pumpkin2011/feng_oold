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
    name "淘帮忙"
    province "310000"
    city  "310100"
    district "310115"
    address "海外高桥保税区富特北路18号联安大厦5楼"
    introduction "淘帮忙项目起源地, 希望我们能离梦想更进一步"
  end

end
