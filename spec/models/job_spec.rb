# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  enterprise_id      :integer
#  company_id         :integer
#  contact_id         :integer
#  position_id        :integer
#  name               :string           not null
#  gender             :string           not null
#  age_min            :integer          not null
#  age_max            :integer          not null
#  salary_basic       :integer          not null
#  salary_min         :integer          not null
#  salary_max         :integer          not null
#  state              :string           not null
#  deleted_at         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  quantity           :integer          not null
#  appointments_count :integer
#
# Indexes
#
#  index_jobs_on_age_max        (age_max)
#  index_jobs_on_age_min        (age_min)
#  index_jobs_on_company_id     (company_id)
#  index_jobs_on_contact_id     (contact_id)
#  index_jobs_on_deleted_at     (deleted_at)
#  index_jobs_on_enterprise_id  (enterprise_id)
#  index_jobs_on_gender         (gender)
#  index_jobs_on_name           (name)
#  index_jobs_on_position_id    (position_id)
#  index_jobs_on_salary_basic   (salary_basic)
#  index_jobs_on_salary_max     (salary_max)
#  index_jobs_on_salary_min     (salary_min)
#  index_jobs_on_state          (state)
#

require 'rails_helper'

RSpec.describe Job, type: :model do
  it { should belong_to(:enterprise) }
  it { should belong_to(:company) }
  it { should belong_to(:contact) }
  it { should belong_to(:position) }
  it { should have_one(:management_fee) }
  it { should have_many(:male_fees) }
  it { should have_many(:female_fees) }
  it { should accept_nested_attributes_for(:management_fee) }
  it { should accept_nested_attributes_for(:male_fees) }
  it { should accept_nested_attributes_for(:female_fees) }
  it { should have_many(:appointments) }

  it "标准数据" do
    expect(build(:job)).to be_valid
  end

  describe "岗位标题" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
    pending '敏感词及特殊字符过滤'
  end

  describe "性别" do
    it { should enumerize(:gender).in(:male, :female, :unknown).with_default(:unknown) }
  end

  describe "年龄Min" do
    it { should validate_presence_of(:age_min) }
    it do
      should validate_numericality_of(:age_min)
              .is_greater_than_or_equal_to(16)
              .only_integer
    end
  end

  describe "年龄Max" do
    it { should validate_presence_of(:age_max) }
    it do
      should validate_numericality_of(:age_max)
        .is_less_than_or_equal_to(60)
        .only_integer
    end
  end

  describe "基本工资" do
    it { should validate_presence_of(:salary_basic) }
    it do
      should validate_numericality_of(:salary_basic)
        .only_integer
    end
  end

  describe "综合工资Min" do
    it { should validate_presence_of(:salary_min) }
    it do
      should validate_numericality_of(:salary_basic)
      .only_integer
    end
  end

  describe "综合工资Max" do
    it { should validate_presence_of(:salary_max) }
    it do
      should validate_numericality_of(:salary_basic)
      .only_integer
    end
  end

  describe "职位" do
    it { should validate_presence_of(:position) }
  end
  #
  # describe "联系人" do
  #   it { should validate_presence_of(:contact) }
  # end
  #
  # describe "公司" do
  #   it { should validate_presence_of(:company) }
  # end

  describe "状态" do
    pending "状态详细"
  end

end
