Rails.application.routes.draw do
  get 'welcome/index'

    devise_for :users
    resources :contacts
    root 'welcome#index'
end
