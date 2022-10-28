# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'products/index'
  get 'products/new'
  post 'products/new', to: 'products#create'
  get 'products/index', to: 'products#index', as: 'products_by_category'
  get 'products/update', to: 'products#update', as: 'product_edit'
  post 'products/update', to: 'products#send_changes'
  get 'products/delete', to: 'products#delete', as: 'product_delete'
  get 'reservas/new/:sala/:fecha/:horario', to: 'reservas#new', as: 'new_reserva'
  post 'reservas/new/:sala/:fecha/:horario', to: 'reservas#create'
  get 'movie/new'
  post 'movie/new', to: 'movie#post', as: 'create_movie'
  post 'movie_time/new', to: 'movie#create_movie_time', as: 'new_movie_time'
  get '/', to: 'movie#home', as: 'home'
  get 'movies/list', to: 'movie#list_by_date', as: 'movies_by_date'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
