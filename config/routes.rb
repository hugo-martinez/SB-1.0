Rails.application.routes.draw do
  get 'users/search.json' => 'users#search'
  get 'courses/search.json' => 'courses#search'
  get 'demands/search.json' => 'demands#search'
  resources :demands
  resources :dispo_users
  resources :lessons
  resources :keyword_courses
  resources :keyword_dems
  resources :themes
  resources :courses
  resources :users
  get 'home/index'
  get 'users/search/:user_name' => 'users#search'
  get 'courses/search/:user_id' => 'courses#search'
  get 'demands/search/:user_id' => 'demands#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
