Rails.application.routes.draw do
  root 'welcome#index'
  # 送人方
  namespace :song do
    root 'welcome#index'
  end

  # 招聘方
  namespace :zhao do
    root 'welcome#index'
  end

  # 运营方
  namespace :admin do
    root 'welcome#index'
  end
  devise_for :user_zhaos
  devise_for :user_songs
  devise_for :user_admins
end
