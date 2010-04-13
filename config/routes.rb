ActionController::Routing::Routes.draw do |map|
  map.resources :lessons
  map.resources :time_slots
  map.resources :students
  map.resources :student_sessions
  map.resources :teachers
  map.resources :teacher_sessions

  map.root :controller => "welcome"

  # Tor, how do I make the payments work without these?
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  # Instead of this:
  #map.resources :payments

end
