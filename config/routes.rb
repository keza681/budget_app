Rails.application.routes.draw do
  devise_for :users
  # get 'users/index'
  unauthenticated :user do
    root to: 'users#index'
  end
end
