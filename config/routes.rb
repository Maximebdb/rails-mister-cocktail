Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails, only: [:new, :update, :show, :edit, :create, :index, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  # get    "cocktails",          to: "cocktails#index"

  # get    "cocktails/new",      to: "cocktails#new"
  # post   "cocktails",          to: "cocktails#create"

  # get    "cocktails/:id",      to: "cocktails#show"

  # get    "cocktails/:id/edit", to: "cocktails#edit"
  # patch  "cocktails/:id",      to: "cocktails#update"

  # delete "cocktails/:id",      to: "cocktails#destroy"
end
