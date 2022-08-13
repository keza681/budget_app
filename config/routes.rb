Rails.application.routes.draw do
  # get 'users/index'
  unauthenticated :user do
    root to: 'users#index'
  end
end
