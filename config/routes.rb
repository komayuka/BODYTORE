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


  root 'homes#top'
  #trainer側サイトrouting
  namespace :trainer do
  end


  # customer側サイトrouting
  scope module: :customer do
  end

 end
