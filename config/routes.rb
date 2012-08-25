Fmf4::Application.routes.draw do

  root :to => 'users#new'

  #get "/products/:category" => "Produces#showtype", :as => "protype"

  get "/products/list" => 'products#list', :as => :farmer_list

  get "/user/new2" => 'users#new2', :as => :user_new2
  put "/user/new2" => 'users#new2'

  get "session/newlogin" => 'sessions#newlogin', :as => :newlogin

  delete "/logout" => 'sessions#destroy', :as => :signout

  resources :order_items

  resources :orders

  resources :products

  resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

end
