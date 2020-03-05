Rails.application.routes.draw do

  root to: 'couriers#index'

  resources :couriers

end
