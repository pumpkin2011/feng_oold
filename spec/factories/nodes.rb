# == Schema Information
#
# Table name: nodes
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  icon         :string           not null
#  uri          :string           not null
#  domain       :string           not null
#  published_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :node do
    name "测试菜单"
    icon "fa-hourglass"
    uri "/demo"
    domain "admin"
  end

end
