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

require 'rails_helper'

RSpec.describe Node, type: :model do
  it "标准数据" do
    expect(build(:node)).to be_valid
  end

  describe "name" do
    it { should have_db_column(:name).of_type(:string)}
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(10) }
  end

  describe "icon" do
    it { should have_db_column(:icon).of_type(:string)}
    it { should validate_presence_of(:icon) }
    it { should validate_length_of(:icon).is_at_most(20) }
  end

  describe 'uri' do
    it { should have_db_column(:uri).of_type(:string)}
    it { should validate_presence_of(:uri) }
    it { should validate_length_of(:uri).is_at_most(20) }
  end

  describe "domain" do
    it { should have_db_column(:domain).of_type(:string) }
    it { should enumerize(:domain).in(:zhao, :song, :admin) }
  end

  describe "published_at" do
    it { should have_db_column(:published_at).of_type(:datetime)}
  end
end
