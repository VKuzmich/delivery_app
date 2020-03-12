# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'couriers#index'

  resources :couriers, only: [:show, :create, :new, :index, :destroy, :update] do
    resources :packages
  end
end
