module CashInHelper
  def render_cash_in_icon_with_state(cash_in)
    if cash_in.pending?
      'glyphicon-time'
    elsif cash_in.confirmed?
      'glyphicon-ok'
    else
      'glyphicon-remove'
    end
  end

  def render_active_by_state(param=nil)
    'active' if params[:state] == param
  end

end
