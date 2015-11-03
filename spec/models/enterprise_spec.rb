# == Schema Information
#
# Table name: enterprises
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  mobile                 :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_enterprises_on_account               (mobile,email) UNIQUE
#  index_enterprises_on_confirmation_token    (confirmation_token) UNIQUE
#  index_enterprises_on_email                 (email)
#  index_enterprises_on_mobile                (mobile)
#  index_enterprises_on_name                  (name) UNIQUE
#  index_enterprises_on_reset_password_token  (reset_password_token) UNIQUE
#  index_enterprises_on_unlock_token          (unlock_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Enterprise, type: :model do
  it "标准数据" do
    expect(build(:enterprise)).to be_valid
  end

  it { should have_many(:contacts) }
  it { should have_many(:labors) }
  it { should have_many(:companies) }
  it { should have_many(:jobs) }
  it { should have_many(:cash_outs) }

  describe "用户名" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_index(:name).unique(true) }
  end

  describe "手机" do
    it { should have_db_column(:mobile).of_type(:string) }
    it { should have_db_index(:mobile) }
  end

  describe "邮箱" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_index(:email) }
  end

end
