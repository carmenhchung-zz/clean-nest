Rails.application.routes.draw do
  root 'pages#home'

# Override the Devise code, including pointing to the registrations controller, where you are now able to edit your profile without entering in your current password (overriding Devise).
  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registrations: 'registrations'}

# Allow appointments to be made and linked to users - but only let customers create, and not edit or delete, appointments. Also let them create availabilities.
  resources :users do
    resources :appointments, only: [:new, :create]
    resources :availabilities
  end

  resources :homes

# Messages go inside conversations because they all belong to conversations.
  resources :conversations, only: [:index, :create, :destroy, :delete] do
    resources :messages, only: [:index, :create, :destroy, :delete]
  end

  # get '/your_appointments', to: 'appointments#your_appointments'
# Only create the path to show user information - create/update is taken care of by Devise.
  get '/userprofile/:id', to: 'users#show', as: 'showuser'

  get 'search' => 'pages#search'
end
