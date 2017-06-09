Rails.application.routes.draw do
    devise_for :users
    resources :contacts do
        resources :reaches
    end
    root 'welcome#index'

    get 'contacts/long_term', to: 'contacts#index', as: 'long_term'
end
