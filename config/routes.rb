Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :user_zhaos
  devise_for :user_songs
end
