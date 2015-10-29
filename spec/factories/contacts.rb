# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  user_zhao_id :integer
#  name         :string           not null
#  mobile       :string           not null
#  gender       :string           not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_contacts_on_deleted_at    (deleted_at)
#  index_contacts_on_gender        (gender)
#  index_contacts_on_mobile        (mobile)
#  index_contacts_on_name          (name)
#  index_contacts_on_user_zhao_id  (user_zhao_id)
#

FactoryGirl.define do
  factory :contact do
    user_zhao nil
name "MyString"
mobile "MyString"
gender "MyString"
deleted_at "2015-10-29 15:15:47"
  end

end
