TravAgency::Application.routes.draw do
  resources :tours do
    collection { post :search, to: 'tours#search'} #?? index
  end
  resources :hotels do
    collection { post :search, to: 'hotels#search'} #?? index
  end
  resources :bookings
  #       get 'recent', :on => :collection
  root to: 'welcome#index'
end
