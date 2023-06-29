# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'weapon', to: 'weapon#all'
  resources :weapon, controller: :weapon, only: %i[create update destroy]

  get 'tool', to: 'tool#all'
  resources :tool, controller: :tool, only: %i[create update destroy]

  get 'consumable', to: 'consumable#all'
  resources :consumable, controller: :consumable, only: %i[create update destroy]

  get 'ammo_type', to: 'ammo_type#all'
  resources :ammo_type, controller: :ammo_type, only: %i[create update destroy]

  get 'loadout/random', to: 'loadout#random'
end
