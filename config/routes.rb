# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  get 'home/index'

  namespace :api do
    namespace :v1 do
      resources :prime_tables, only: [:index]
    end
  end
end
