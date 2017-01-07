Rails.application.routes.draw do
  resources :dispo_users
  get 'users/search.json' => 'users#search'
  get 'users/find_courses.json' => 'users#find_courses'
  get 'courses/search.json' => 'courses#search'
  resources :lessons
  resources :keyword_courses
  resources :keyword_dems
  resources :themes
  resources :demands
  resources :courses
  resources :users
  get 'home/index'
  get 'users/search/:user_name' => 'users#search'
  get 'users/find_courses/:user_id' => 'users#user_id'
  get 'courses/search/:user_id' => 'courses#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
