Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  resources 'districts', :path => 'api/v1/districts'
<<<<<<< Updated upstream
  resources 'districts', :path => 'api/v1/user_types'
=======
  resources 'user_types', :path => 'api/v1/user_types'

>>>>>>> Stashed changes
end
