Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'categories#index'

  get "tasks/today" => "tasks#today"
  get "tasks/overdue" => "tasks#overdue"

  resources :categories do
    resources :tasks
  end

  # get 'categories' => 'categories#index'

  # get 'categories/:id' => 'categories#show'

  # get 'categories/new' => 'categories#new'

  # post 'categories' => 'categories#create'

end
