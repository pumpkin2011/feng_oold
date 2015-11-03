module ApplicationHelper

  # 用户名显示
  def render_user_name
    case params[:controller]
    when /^song|^zhao/
      current_enterprise.name
    when /^admin/
      current_user_admin.name
    end
  end

  # 退出连接
  def render_user_sign_out
    case params[:controller]
    when /^song|^zhao/
      link_to "退出", destroy_enterprise_session_path, method: :delete, class: 'btn btn-default btn-flat'
    when /^admin/
      link_to "退出", destroy_admin_session_path, method: :delete, class: 'btn btn-default btn-flat'
    end
  end

  # 标题
  def render_panel_title
    case params[:controller]
    when /^song/
      "淘帮忙-送人系统"
    when /^zhao/
      "淘帮忙-招人系统"
    when /^admin/
      "淘帮忙-运营系统"
    end
  end


  # 标题logo
  def render_panel_logo
    case params[:controller]
    when /^song/
      "送"
    when /^zhao/
      "招"
    when /^admin/
      "运"
    end
  end


  # 获取完成地址: 海市市辖区浦东新区
 def render_common_china_city_address(param)
   ChinaCity.get(param.district, prepend_parent: true)
 end

 # 手机号码显示: 186-2124-8234
 def render_common_mobile(mobile)
   "#{mobile.slice(0,3)}-#{mobile.slice(3,4)}-#{mobile.slice(7,4)}"
 end
end
