Rails.application.routes.draw do
  resources :moods, param: :slug, only: [:index]

  resources :users, param: :slug do
    resources :moods, only: [:show, :edit, :create]
  end

  root 'moods#index'
end
