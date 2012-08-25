Fmf4::Application.routes.draw do

  root :to => 'users#new'

  get "user/list" => 'users#list', :as => :chef_list

  get "/products/list" => 'products#list', :as => :farmer_list

  get "/user/new2" => 'users#new2', :as => :user_new2
  #put "/user/new2" => 'users#new2'
  put "/user/update2" => 'users#update2', :as => :update2
  
  get "/product/new3" => 'products#new3', :as => :farmer_step3
  put "/product/new3" => 'products#new3'
  
  get "/user/new3" => 'users#new3', :as => :chef_step3
  put "/user/new3" => 'users#new3'

  get "session/newlogin" => 'sessions#newlogin', :as => :newlogin

  delete "/logout" => 'sessions#destroy', :as => :signout

  resources :order_items

  resources :orders

  resources :products

  resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

end
