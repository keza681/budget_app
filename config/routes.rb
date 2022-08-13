Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: 'users#index'
  end

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  resources :categories do
    resources :transactions
  end

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
end
