# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  company_id    :integer
#  contact_id    :integer
#  position_id   :integer
#  name          :string           not null
#  gender        :string           not null
#  age_min       :integer          not null
#  age_max       :integer          not null
#  salary_basic  :integer          not null
#  salary_min    :integer          not null
#  salary_max    :integer          not null
#  state         :string           not null
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
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

FactoryGirl.define do
  factory :job do
    association :enterprise
    association :company
    association :contact
    association :position
    name "测试职位xx"
    gender "male"
    age_min 18
    age_max 30
    salary_basic 3000
    salary_min 2000
    salary_max 5000
  end

end
