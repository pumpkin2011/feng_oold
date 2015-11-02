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

  def render_user_type(cash_in, expected_type)
    if cash_in.new_record?
      "active" if expected_type == "UserZhao"
    else
      cash_in.user_type == expected_type ? "active" : nil
    end
  end
end
