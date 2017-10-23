Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registrations: 'registrations'}
  # Override the Devise code, including pointing to the registrations controller, where you are now able to edit your profile without entering in your current password (overriding Devise).

  # resources :users, only: [:show]
  # Only create the path to show user information - create/update is taken care of by Devise.

  resources :homes, except: [:edit] do
    member do
      get 'listing'
    end
    # For every home ID, route to the above things. These are in the controller.
  end
end
