class Common::CashOutsController < ApplicationController
  before_action :set_cash_out, only: [:edit, :update, :destroy, :cancel]

  respond_to :html, :js

  def index
    @cash_outs = current_enterprise.cash_outs.page params[:page]
    respond_with(@cash_outs)
  end


  def new
    @cash_out = CashOut.new
    respond_with(@cash_out)
  end

  def edit
  end

  def create
    @cash_out = current_enterprise.cash_outs.build(cash_out_params)
    @cash_out.save
    redirect_to action: :index
  end

  def update
    @cash_out.update(cash_out_params)
    respond_with(@cash_out,location: cash_outs_path)
  end

  def destroy
    @cash_out.destroy
    respond_with(@cash_out)
  end

  private
    def set_cash_out
      @cash_out = current_enterprise.cash_outs.find(params[:id])
    end

    def cash_out_params
      params.require(:cash_out).permit(:amount)
    end
end
