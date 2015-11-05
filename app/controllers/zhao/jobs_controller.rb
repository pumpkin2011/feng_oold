class Zhao::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # before_action :filter_job_params, only: [:update, :create]

  respond_to :html, :js

  def index
    @jobs = current_enterprise.jobs.includes(:position, :company, :contact).page params[:page]
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    @job.male_fees.build
    @job.female_fees.build
    @job.build_management_fee
    respond_with(@job)
  end

  def edit
    Job.before_edit(@job)
  end

  def create
    @job = current_enterprise.jobs.build(job_params)
    @job.save
    respond_with(@job, location: zhao_jobs_path)
  end

  def update
    @job.update(job_params)
    respond_with(@job, location: zhao_jobs_path)
  end

  def destroy
    @job.destroy
    respond_with(@job, location: zhao_jobs_path)
  end

  private
    def set_job
      @job = current_enterprise.jobs.find(params[:id])
    end

    # def filter_job_params
      # @job_params = Job.filter_params(job_params)
    # end

    def job_params
      params.require(:job).permit(:name, :gender, :age_min, :age_max, :salary_min, :salary_max,
                                  :salary_basic, :position_id, :company_id, :contact_id, :fee_type,
                                  management_fee_attributes: [:amount, :months, :day, :deadline],
                                  male_fees_attributes: [:gender, :days, :amount, :deadline, :_destroy, :id],
                                  female_fees_attributes: [:gender, :days, :amount, :deadline, :_destroy, :id])
    end
end
