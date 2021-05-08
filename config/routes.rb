Rails.application.routes.draw do
  devise_for :trainers,  controllers: {
    sessions:      'trainers/sessions',
    password:      'trainers/password',
    registrations: 'trainers/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    password:      'customers/password',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
