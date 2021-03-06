Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/trainer_top' => 'homes#trainer_top'
  get 'homes/customer_top' => 'homes#customer_top'
  get 'rakuten/rakuten_search' => 'rakuten#search'

  devise_for :trainers, controllers: {
    sessions: 'trainers/sessions',
    password: 'trainers/password',
    registrations: 'trainers/registrations'
  }

  # trainer側サイトrouting
  scope module: :trainer do
    resources :trainers do
      resources :training_menus
    end
    get 'trainers/profile/edit' => 'trainers#edit'
    patch 'trainers/profile' => 'trainers#update'
    resources :reviews, only: %i[index]
  end

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    password: 'customers/password',
    registrations: 'customers/registrations'
  }

  # customer側サイトrouting
  scope module: :customer do
    get 'customer/trainers' => 'trainers#index'
    get 'customer/trainers/:id' => 'trainers#show'
    get 'customer/trainers/:trainer_id/training_menus/:id' => 'training_menus#show'
    post 'customers/trainers/:trainer_id/favorites' => 'favorites#create', as: 'favorites'
    delete 'customers/trainers/:trainer_id/favorites' => 'favorites#destroy'
    resources :customers do
      get 'customers/profile/edit' => 'customers#edit'
      patch 'customers/profile' => 'customers#update'
      delete 'customers/profile/delete' => 'customers#destroy'
      resources :diaries
      get :favorites, on: :collection
      resources :trainers, only: %i[index show] do
        resources :training_menus, only: %i[index show]
        resources :reviews, only: %i[index new update create destroy edit]
      end
    end
  end
end
