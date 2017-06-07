Rails.application.routes.draw do
  get 'welcome/index'

    devise_for :users
    resources :contacts do
        resources :reaches
    end
    root 'welcome#index'
end
