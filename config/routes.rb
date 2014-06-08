Rails.application.routes.draw do
  resources :mood

  root 'mood#index'
end
