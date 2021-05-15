Rails.application.routes.draw do
  root 'homes#top'

  devise_for :trainers,  controllers: {
    sessions:      'trainers/sessions',
    password:      'trainers/password',
    registrations: 'trainers/registrations'
  }


  #trainer側サイトrouting
  scope module: :trainer do
    resources :trainers do
      resources :training_menus
    end
    get 'trainers/profile/edit' => 'trainers#edit'
    patch 'trainers/profile' => 'trainers#update'
  end


  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    password:      'customers/password',
    registrations: 'customers/registrations'
  }


  # customer側サイトrouting
  scope module: :customer do
    resources :customers, only: [:show, :update] do
     get 'customers/profile/edit' => 'customers#edit'
     patch 'customers/profile' => 'customers#update'
    resources :trainers, only: [:index, :show] do
     resources :training_menus, only: [:index, :show]
     resource :favorites, only: [:create, :destroy]
    end
    end
  end

 end
