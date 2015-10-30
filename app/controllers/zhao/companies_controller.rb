class Zhao::CompaniesController < ApplicationController
  before_action :set_zhao_company, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @companies = current_user_zhao.companies.page params[:page]
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = current_user_zhao.companies.new(company_params)
    @company.save
    respond_with(@company,location: zhao_companies_path)
  end

  def update
    @company.update(company_params)
    respond_with(@company,location: zhao_companies_path)
  end

  def destroy
    @company.destroy
    respond_with(:zhao, @company)
  end

  private
    def set_zhao_company
      @company = current_user_zhao.companies.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :province, :city, :district, :address, :introduction)
    end
end
