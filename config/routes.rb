Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :user_zhaos
end
