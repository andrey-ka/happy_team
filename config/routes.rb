Rails.application.routes.draw do
  devise_for :members

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#application_error', via: :all
  root 'home#index'
end
