module LaborHelper
  def render_labor_gender_with_age(labor)
    "#{labor.gender_text}-#{((Date.today - labor.birthday) / 365).floor}岁"
  end
end