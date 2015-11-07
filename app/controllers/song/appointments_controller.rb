class Song::AppointmentsController < ApplicationController
  before_action :set_labor_and_job, only: [:create]

  def create
    render js: "alert('该工友正准备面试中');" and return unless @labor.yidengji?

    @appointment = Appointment.new(labor: @labor, job: @job)
    if params[:controller] =~ /^song/
      @appointment.song_enterprise = current_enterprise
    else params[:controller] =~ /^zhao/
      @appointment.zhao_enterprise = current_enterprise
    end

    if @appointment.save then
      @labor.baoming!
      render js: "alert('报名成功');"
    else
      render js: "alert('报名失败');"
    end
  end

  private
    def set_labor_and_job
      @labor = Labor.find(params[:labor])
      @job   = Job.find(params[:job])
    end

end
