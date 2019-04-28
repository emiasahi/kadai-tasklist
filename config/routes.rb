Rails.application.routes.draw do
  get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #元の文章root to: 'tasks#index'
  #元の文章resources :tasks
  root to: 'toppages#index'
end
