Rails.application.routes.draw do
  get 'users/search.json' => 'users#search'
  resources :lessons
  resources :dispo_dems
  resources :dispo_courses
  resources :keyword_courses
  resources :keyword_dems
  resources :themes
  resources :demands
  resources :courses
  resources :users
  get 'home/index'
  get 'users/search/:user_name' => 'users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
