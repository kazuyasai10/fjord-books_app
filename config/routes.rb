Rails.application.routes.draw do
  resources :companies
  root to: 'books#index'
  devise_for :users
  resources :books
  resources :users, only: [:index,:show]
  namespace :admin do
    resources :users, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
