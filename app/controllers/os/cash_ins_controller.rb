class Os::CashInsController < ApplicationController
  before_action :set_cash_in, only: [:show, :edit, :update, :destroy, :set_serial_outer, :reject]

  respond_to :html, :js

  def index
    @cash_ins = CashIn.filter_by_state(params[:type]).page params[:page]
    respond_with(@cash_ins)
  end

  def show
    respond_with(@cash_in)
  end

  def new
    @cash_in = CashIn.new
    respond_with(@cash_in)
  end

  def edit
  end

  def create
    @cash_in = CashIn.new(cash_in_params)
    @cash_in.channel = 'offline'
    @cash_in.serial_inner = rand(10000)
    @cash_in.save
    respond_with(@cash_in, location: os_cash_ins_path)
  end

  def update
    @cash_in.update(cash_in_params)
    respond_with(@cash_in, location: os_cash_ins_path)
  end

  def destroy
    @cash_in.destroy
    respond_with(@cash_in, location: os_cash_ins_path)
  end

  def reject
    @cash_in.reject! if @cash_in.pending?
  end

  private
    def set_cash_in
      @cash_in = CashIn.find(params[:id])
    end

    def cash_in_params
      params.require(:cash_in).permit(:username, :user_type, :amount, :serial_outer, :note)
    end
end
