class Song::JobsController < ApplicationController
  respond_to :html, :js

  def index
    @labor = Labor.find(params[:labor]) if params[:labor]
    @jobs = Job.all.page params[:page]
    respond_with(@jobs)
  end

  def show
    @job = Job.find(params[:id])
    respond_with(@job)
  end
end
