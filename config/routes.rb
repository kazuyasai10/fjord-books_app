Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users
  resources :books
  resources :users, only: %i[index show]

  namespace :admin do
    resources :users, only: %i[index edit]
    resources :companies
  end

  resources :companies do
    resources :users, only: %i[index], module: "companies"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
