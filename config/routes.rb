Rails.application.routes.draw do
  root to: 'homes#top'
  resources :posts
  get 'bookers/new'
  post 'bookers' => 'bookers#create'
  get 'bookers/index'
  get 'bookers/:id' => "bookers#show", as: 'booker'
  get 'bookers/:id/edit' => 'bookers#edit', as: 'edit_booker'
  get '/top' => "homes#top"
  patch 'bookers/:id' => 'bookers#update', as: 'update_booker'
  delete 'bookers/:id' => 'bookers#destroy', as: 'destroy_booker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
