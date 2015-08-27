Rails.application.routes.draw do
  mount_devise_token_auth_for 'Worker', at: 'api/v1/workers'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  mount_devise_token_auth_for 'Customer', at: 'api/v1/customers'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  put 'api/v1/users/change_to_worker' => 'users#change_to_buyer'
  patch 'api/v1/users/change_to_worker' => 'users#change_to_buyer'
  get 'api/v1/districts' => 'districts#index'
  get 'api/v1/user_types' => 'user_types#index'
  resources 'groceries', :path => 'api/v1/groceries'
  resources 'grocery_lists', :path => 'api/v1/grocery_lists' do
      resources 'grocery_list_items'
  end
  get '/api/v1/buyers/index' => 'grocery_lists#buyer_index'

  put 'api/v1/grocery_lists/:id/add_worker' => 'grocery_lists#add_worker_to_list'
  patch 'api/v1/grocery_lists/:id/add_worker' => 'grocery_lists#add_worker_to_list'
end
