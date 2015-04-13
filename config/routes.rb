Rails.application.routes.draw do
resources :juicerecipes
root "juicerecipes#index"
end
