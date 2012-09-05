Fmf4::Application.routes.draw do

  root :to => 'users#new'

  get "user/list" => 'users#list', :as => :chef_list

  post "/locations" => 'locations#index2', :as => :locindex_2

  get "/products/list" => 'products#list', :as => :farmer_list
  post "/products/list" => 'products#list2', :as => :farmer_list2

  get "/user/new2" => 'users#new2', :as => :user_new2
  put "/user/update2" => 'users#update2', :as => :update2
  
  get "/product/new3" => 'products#new3', :as => :farmer_step3
  post "/product/new3" => 'products#new4', :as => :farmer_step4
  
  get "/users/homepage" => 'users#homepage'

  get "/user/new3" => 'users#new3', :as => :chef_step3

  get "session/newlogin" => 'sessions#newlogin', :as => :newlogin

  get "session/logout" => 'sessions#destroy', :as => :signout

  resources :ratings
  resources :locations
  resources :order_items
  resources :orders
  resources :products
  resources :users 
  resources :sessions, :only => [:new, :create, :destroy]

  get "about" => 'fmfcompanies#fmf_about', :as => :about
  get "team" => 'fmfcompanies#fmf_team', :as => :team
  get "media" => 'fmfcompanies#fmf_media', :as => :media
  get "contact" => 'fmfcompanies#fmf_contact', :as=> :fmf_contact

end
