# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'couriers#index'

  resources :couriers do
    resources :packages
  end
end
