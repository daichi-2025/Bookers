Rails.application.routes.draw do
  root to: 'homes#top'
  resources :posts
  get 'bookers/new'
  post 'bookers' => 'bookers#create'
  get 'bookers/index'
  get 'bookers/show'
  get 'bookers/edit'
  get '/top' => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
