TravAgency::Application.routes.draw do
  devise_for :users

  resources :tours do
    collection { post :search, to: 'tours#search'} #?? index
    #booking
    # resources :bookings
  end
  resources :hotels do
    collection { post :search, to: 'hotels#search'} #?? index
  end
  resources :bookings
  #       get 'recent', :on => :collection
  root to: 'welcome#index'
end
