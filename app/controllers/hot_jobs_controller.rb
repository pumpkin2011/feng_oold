class HotJobsController < ApplicationController
  layout "user"
  before_action :set_job, only: [:show]
  respond_to :html
  def show
    respond_with(@job)
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end
end
