Rails.application.routes.draw do
  devise_for :users
resources :juicerecipes
root "juicerecipes#index"
end
