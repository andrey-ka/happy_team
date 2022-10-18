Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  namespace :admin do
    get '/', to: 'home#index', as: :home
    resources :projects do
      resources :tasks
    end
  end

  namespace :members, as: :member do
    resources :tasks, only: %i[index show update]
  end

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#application_error', via: :all
  root 'home#index'
end
