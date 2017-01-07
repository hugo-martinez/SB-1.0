Rails.application.routes.draw do
  get 'users/search.json' => 'users#search'
  get 'courses/search.json' => 'courses#search'
  get 'demands/search.json' => 'demands#search'
  get 'lessons/courses_taught.json' => 'lessons#courses_taught'
  get 'lessons/courses_attended.json' => 'lessons#courses_attended'
  resources :lessons
  resources :demands
  resources :dispo_users
  resources :keyword_courses
  resources :keyword_dems
  resources :themes
  resources :courses
  resources :users
  get 'home/index'
  get 'users/search/:user_name' => 'users#search'
  get 'courses/search/:user_id' => 'courses#search'
  get 'demands/search/:user_id' => 'demands#search'
  get 'lessons/courses_taught/:user_id' => 'lessons#courses_taught'
  get 'lessons/courses_attended/:user_id' => 'lessons#courses_attended'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
