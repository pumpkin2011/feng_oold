class Admin::CompaniesController < ApplicationController
  respond_to :html, :js

  def index
    @companies = Company.all.page params[:page]
    respond_with(@companies)
  end

  def show
    @company = Company.find(params[:id])
    respond_with(@company)
  end
end