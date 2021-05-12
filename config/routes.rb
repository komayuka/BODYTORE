Rails.application.routes.draw do
  root 'homes#top'

  devise_for :trainers,  controllers: {
    sessions:      'trainers/sessions',
    password:      'trainers/password',
    registrations: 'trainers/registrations'
  }


  #trainer側サイトrouting
  scope module: :trainer do
    resource :trainers,  only: [:show, :update]
    get 'trainers/profile/edit' => 'trainers#edit'
    patch 'trainers/profile' => 'trainers#update'
    resources :training_menus
  end


  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    password:      'customers/password',
    registrations: 'customers/registrations'
  }


  # customer側サイトrouting
  scope module: :customer do
    resource :customers, only: [:show, :update]
     get 'customers/profile/edit' => 'customers#edit'
     patch 'customers/profile' => 'customers#update'
    get 'customers/trainers' => 'trainers#index'
    get 'customers/trainers/:id' => 'trainers#show'
    resources :training_menus, only: [:index, :show]
  end

 end
