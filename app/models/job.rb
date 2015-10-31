# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  user_zhao_id :integer
#  company_id   :integer
#  contact_id   :integer
#  position_id  :integer
#  name         :string           not null
#  gender       :string           not null
#  age_min      :integer          not null
#  age_max      :integer          not null
#  salary_basic :integer          not null
#  salary_min   :integer          not null
#  salary_max   :integer          not null
#  state        :string           not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_jobs_on_age_max       (age_max)
#  index_jobs_on_age_min       (age_min)
#  index_jobs_on_company_id    (company_id)
#  index_jobs_on_contact_id    (contact_id)
#  index_jobs_on_deleted_at    (deleted_at)
#  index_jobs_on_gender        (gender)
#  index_jobs_on_name          (name)
#  index_jobs_on_position_id   (position_id)
#  index_jobs_on_salary_basic  (salary_basic)
#  index_jobs_on_salary_max    (salary_max)
#  index_jobs_on_salary_min    (salary_min)
#  index_jobs_on_state         (state)
#  index_jobs_on_user_zhao_id  (user_zhao_id)
#

class Job < ActiveRecord::Base
  extend Enumerize
  include AASM
  acts_as_paranoid

  belongs_to :user_zhao
  belongs_to :company
  belongs_to :contact
  belongs_to :position

  validates_presence_of :name, :gender, :age_min, :age_max, :salary_min, :salary_max,
                        :salary_basic, :state, :user_zhao, :position, :company, :contact
  validates :name, length: { in: 5..50}, allow_blank: true
  validates :age_min, numericality: { only_integer: true, greater_than_or_equal_to: 16}, allow_blank: true
  validates :age_max, numericality: { only_integer: true, less_than_or_equal_to: 60}, allow_blank: true
  validates :salary_basic, :salary_min, :salary_max, numericality: { only_integer: true}, allow_blank: true

  enumerize :gender, in: [:male, :female, :unknown], default: :unknown

  default_scope { order('updated_at desc') }

  aasm column: :state do
    state :pending, :initial => true

    # event :sleep do
    #   transitions :from => [:running, :cleaning], :to => :sleeping
    # end
  end
end
