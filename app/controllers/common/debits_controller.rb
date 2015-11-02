class Common::DebitsController < ApplicationController

  respond_to :html


  def show

  end

  def new
    @debit = Debit.new
    respond_with(@debit)
  end


  def create
    @debit = Debit.new(debit_params)
    @debit.save
    respond_with(@debit)
  end


  private

    def debit_params
      params[:debit]
    end
end
