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

class Company < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user_zhao
  default_scope {order('updated_at desc')}
  validates_presence_of :name, :province, :city, :district, :address, :introduction
  validates :name, length: { in: 2..50 }, allow_blank: true
  validates :introduction, length: {minimum: 10 },allow_blank: true
  validates :address, length: {in: 5..50 }, allow_blank: true
end
