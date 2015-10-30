class Song::LaborsController < ApplicationController
  before_action :set_labor, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @labors = current_user_song.labors.all.page params[:page]
    respond_with(@labors)
  end

  def show
    respond_with(@labor)
  end

  def new
    @labor = Labor.new
    respond_with(@labor)
  end

  def edit
  end

  def create
    @labor = current_user_song.labors.build(labor_params)
    @labor.channel = 'web'
    @labor.save
    respond_with(@labor, location: song_labors_path)
  end

  def update
    @labor.update(labor_params)
    respond_with(@labor, location: song_labors_path)
  end

  def destroy
    @labor.destroy
    respond_with(@labor, location: song_labors_path)
  end

  private
    def set_labor
      @labor = current_user_song.labors.find(params[:id])
    end

    def labor_params
      params.require(:labor).permit(
        :name, :mobile, :idcard, :province, :city, :district,
        intention_attributes: [:salary, :province, :city, :district, :position_ids]
      )
    end
end
