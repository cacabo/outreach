Rails.application.routes.draw do
    devise_for :users
    resources :contacts do
        resources :reaches
    end
    root 'welcome#index'
end
