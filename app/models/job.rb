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

class Job < ActiveRecord::Base
  extend Enumerize
  include AASM
  acts_as_paranoid

  attr_accessor :fee_type

  belongs_to :enterprise
  belongs_to :company
  belongs_to :contact
  belongs_to :position
  has_one    :management_fee, dependent: :destroy
  has_many   :appointments
  has_many   :male_fees,   -> { where(gender: 'male') },   class_name: 'RecruitmentFee', dependent: :destroy
  has_many   :female_fees, -> { where(gender: 'female') }, class_name: 'RecruitmentFee', dependent: :destroy

  accepts_nested_attributes_for :management_fee, :male_fees, :female_fees, allow_destroy: true

  validates_presence_of :name, :gender, :age_min, :age_max, :salary_min, :salary_max,
                        :salary_basic, :state, :enterprise, :position, :company, :contact
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

  def self.before_edit(job)
    job.male_fees.build if job.male_fees.blank?
    job.female_fees.build if job.female_fees.blank?
    job.build_management_fee if job.management_fee.blank?
  end

  # def self.filter_params(params)
  #   gender = params[:gender]
  #   fee_type = params[:fee_type]
  #
  #   if fee_type == 'management' then
  #     params.except!(:female_fees_attributes, :male_fees_attributes)
  #   else
  #     params.except!(:management_fee_attributes) if fee_type == 'recruitment'
  #     if gender == 'female' then
  #       params[:male_fees_attributes].map { |k, v| v[:_destroy]=true } if params[:male_fees_attributes]
  #     elsif gender == 'male' then
  #       params[:female_fees_attributes].map { |k, v| v[:_destroy]=true } if params[:female_fees_attributes]
  #     end
  #   end
  #   params
  # end
end
