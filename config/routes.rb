Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: %i[destroy]
  resources :reviews, only: :destroy
end
