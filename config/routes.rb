Rails.application.routes.draw do
    root to: 'pages#home'
    get 'gallery', to: 'pages#gallery'
    get 'brands', to: 'pages#brands'
    resources :contacts, only: :create
    get 'contact', to: 'contacts#new', as: 'new_contact'
end

