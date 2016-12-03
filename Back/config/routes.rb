Rails.application.routes.draw do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
