TravAgency::Application.routes.draw do
  devise_for :users do
    match 'sign_up' => 'devise/registrations#new', as: 'sign_up'
    match 'login' => 'devise/sessions#new', as: 'login'
    match 'logout' => 'devise/sessions#destroy', as: 'logout'
  end

  resources :tours do
    collection { get :search, to: 'tours#search'}
    resources :bookings
  end
  resources :hotels do
    collection { get :search, to: 'hotels#search'}
    resources :bookings
  end
  resources :users, only: [] do
    resources :bookings
  end

  root to: 'welcome#index'

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end
end
