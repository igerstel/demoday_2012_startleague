Fmf4::Application.routes.draw do

  root :to => 'users#index'

  get "/products/:category" => "Produces#showtype", :as => "protype"

  resources :order_items

  resources :orders

  resources :products

  resources :users

end
