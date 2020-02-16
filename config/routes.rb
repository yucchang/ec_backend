Rails.application.routes.draw do
  devise_for :users

  root "products#index"
  resources :products, only: [:index, :show]

  # backend
  namespace :admin do 
    root "products#index"
    resources :products do 
      delete :remove_image, on: :member
    end 
  end 
end
