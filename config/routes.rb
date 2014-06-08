Rails.application.routes.draw do
  resources :mood

  resources :board

  root 'board#index'
end
