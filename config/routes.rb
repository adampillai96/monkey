Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post :add_product, to: 'carts#add_product'
    delete :remove_product, to: 'carts#remove_product'
    patch :update_product, to: 'carts#update_product'
    get :carts, to: "carts#show"

  root to: 'landing#index'
  resources :products

end
