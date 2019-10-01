Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails-admin', as: 'rails_admin'
  resources :special_device_list_devices
  resources :special_device_lists
  resources :vulnerability_scan_results
  resources :outage_reports
  resources :organizations
  resources :users
  resources 'devices', only: ['show', 'index']

  # Pages
  get 'about',   to: 'pages#about'
  get 'network', to: 'pages#network'

  # Root
  root 'pages#home'
end
