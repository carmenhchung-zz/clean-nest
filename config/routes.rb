Rails.application.routes.draw do
  root 'pages#home'

# Override the Devise code, including pointing to the registrations controller, where you are now able to edit your profile without entering in your current password (overriding Devise).
  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registrations: 'registrations'}

  resources :users do
  resources :appointments, only: [:create]
  end
  
# Only create the path to show user information - create/update is taken care of by Devise.
  get '/userprofile/:id', to: 'users#show', as: 'showuser'

# Only allow user to create an appointment - not edit or delete them.
  resources :homes do
      resources :appointments, only: [:create]
  end

end