require 'sidekiq/web'
Rails.application.routes.draw do
  root 'welcome#index'
  resources :hot_jobs, only: [:show]
  # 送人方
  namespace :song do
    root 'welcome#index'
    resources :labors
    resources :jobs, only: [:index ,:show]
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
    resources :labors
    resources :cash_ins do
      patch :reject, on: :member
    end
  end

  # 公共
  scope module: 'common' do
    resource :profile
    resources :cash_outs, expect: [:show]
    resource :debit
  end
  mount ChinaCity::Engine => '/china_city'
  devise_for :admins
  devise_for :enterprises
end
