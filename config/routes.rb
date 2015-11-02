require 'sidekiq/web'
Rails.application.routes.draw do
  root 'welcome#index'
  # 送人方
  namespace :song do
    root 'welcome#index'
    resources :labors
  end

  # 招聘方
  namespace :zhao do
    root 'welcome#index'
    resources :companies
    resources :contacts
    resources :jobs
  end

  # 运营方
  namespace :admin do
    root 'welcome#index'
    mount Sidekiq::Web => '/sidekiq'
  end

  # 公共
  scope module: 'common' do
    resource :profile
    resource :debit
  end
  mount ChinaCity::Engine => '/china_city'
  devise_for :user_zhaos
  devise_for :user_songs
  devise_for :user_admins
end
