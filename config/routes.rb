ActionController::Routing::Routes.draw do |map|
  map.resources :payments
  map.resources :lessons
  map.resources :time_slots
  map.resources :students
  map.resources :student_sessions
  map.resources :teachers
  map.resources :teacher_sessions

  map.root :controller => "welcome"

end
