class Admin::EnterprisesController < ApplicationController
  respond_to :html, :js

  def index
    @enterprises = Enterprise.all.page params[:page]
    respond_with(@enterprises)
  end

  def show
    @enterprise = Enterprise.find(params[:id])
    respond_with(@enterprise)
  end
end