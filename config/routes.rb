Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  put 'api/v1/users/:id/change_user_types' => 'users#change_user_types'
  patch 'api/v1/users/:id/change_user_types' => 'users#change_user_types'
  get 'api/v1/users/user_types/:id' => 'users#search_user_types'
  resources 'districts', :path => 'api/v1/districts'
  resources 'districts', :path => 'api/v1/user_types'
end
