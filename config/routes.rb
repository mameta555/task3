Rails.application.routes.draw do
  resources :books, only:[:index, :create, :destroy, :show, :edit, :update]
  resources :users, only:[:index, :show, :edit, :update]
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => "homes#about", as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
