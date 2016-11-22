Rails.application.routes.draw do
  resources :lessons
  resources :dispo_pupils
  resources :dispo_teaches
  resources :themes
  resources :pupil_keywords
  resources :teach_keywords
  resources :pupils
  resources :teachers
  resources :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
