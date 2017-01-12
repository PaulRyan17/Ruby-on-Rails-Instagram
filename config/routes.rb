Rails.application.routes.draw do
  get 'profile/home'

  get 'login/login'
  get 'login/validatebyinstagram'
  get 'login/redirectToProfile'
  get 'profile/home'
  get 'profile/logout'
  root 'login#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
