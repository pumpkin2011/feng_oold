module ApplicationHelper

  # 用户名显示
  def render_user_name
    case params[:controller]
    when /^song/
      current_user_song.name
    when /^zhao/
      current_user_zhao.name
    when /^admin/
      current_user_admin.name
    end
  end

  # 退出连接
  def render_user_sign_out
    case params[:controller]
    when /^song/
      link_to "退出", destroy_user_song_session_path, method: :delete, class: 'btn btn-default btn-flat'
    when /^zhao/
      link_to "退出", destroy_user_zhao_session_path, method: :delete, class: 'btn btn-default btn-flat'
    when /^admin/
      link_to "退出", destroy_user_admin_session_path, method: :delete, class: 'btn btn-default btn-flat'
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
end
