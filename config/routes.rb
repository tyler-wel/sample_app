Rails.application.routes.draw do
  get     'sessions/new'
  root    'static_pages#home'
  get     '/help',      to: 'static_pages#help'
  get     '/about',     to: 'static_pages#about'
  get     '/contact',   to: 'static_pages#contact'
  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#delete'

  resources :users
  resources :boards, only: [:create, :destroy, :show]
  resources :task_lists, only: [:new, :create, :destroy]
  resources :tasks, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
end
