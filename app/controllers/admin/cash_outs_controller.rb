class Admin::CashOutsController < ApplicationController
  before_action :set_cash_out, only: [:show, :edit, :update]

  respond_to :html, :js

  def index
    @cash_outs = CashOut.includes(:enterprise).where(:cash_outs => { :state => ['pending' ,'success' ,'failure' ] }).page params[:page]
    respond_with(@cash_outs)
  end
  def show
    respond_with(@cash_out)
  end
  def edit
  end

  def update
    unless params[:cash_out][:serial_outer].blank?
      @cash_out['state'] = 'success'
    end
    @cash_out.update(cash_out_params)
    respond_with(@cash_out, location: admin_cash_outs_path)
  end
  private
    def set_cash_out
      @cash_out = CashOut.find(params[:id])
    end

    def cash_out_params
      params.require(:cash_out).permit(:note, :serial_outer)
    end
end
