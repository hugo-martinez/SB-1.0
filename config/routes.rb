Rails.application.routes.draw do
  get 'users/search.json' => 'users#search'
  get 'courses/search.json' => 'courses#search'
  get 'demands/search.json' => 'demands#search'
  get 'conversations/search.json' => 'conversations#search'
  get 'user_verifs/verif.json' => 'user_verifs#verif'
  get 'lessons/lessons_taught.json' => 'lessons#lessons_taught'
  get 'lessons/lessons_attended.json' => 'lessons#lessons_attended'
  get 'lessons/lessons_remaining.json' => 'lessons#lessons_remaining'
  get 'lessons/every_lessons.json' => 'lessons#every_lessons'
  get 'notifs/search.json' => 'notifs#search'
  get 'messages/search.json' => 'messages#search'
  resources :user_verifs
  resources :conversations
  resources :messages
  resources :notifs
  resources :feed_backs
  resources :lessons
  resources :demands
  resources :dispo_users
  resources :keyword_courses
  resources :keyword_dems
  resources :themes
  resources :courses
  resources :users
  get 'home/index'
  root 'home#index'
  get 'users/search/:email' => 'users#search'
  get 'user_verifs/verif/:token' => 'user_verifs#verif'
  get 'courses/search/:user_id' => 'courses#search'
  get 'demands/search/:user_id' => 'demands#search'
  get 'notifs/search/:user_id' => 'notifs#search'
  get 'messages/search/:user_id' => 'messages#search'
  get 'conversations/search/:user_id' => 'conversations#search'
  get 'lessons/lessons_taught/:user_id' => 'lessons#lessons_taught'
  get 'lessons/lessons_attended/:user_id' => 'lessons#lessons_attended'
  get 'lessons/lessons_remaining/:user_id' => 'lessons#lessons_remaining'
  get 'lessons/every_lessons/:user_id' => 'lessons#every_lessons'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
