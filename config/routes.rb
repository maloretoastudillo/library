Rails.application.routes.draw do

  resources :books
  resources :borrowings

  root 'books#index'

end
