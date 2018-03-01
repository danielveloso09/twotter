Rails.application.routes.draw do
  resources :posts
  resources :timeline, only: [:index]

  # Devise routes
  devise_for :users
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  root 'posts#index'
end
