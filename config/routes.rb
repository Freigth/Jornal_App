Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'categories#index'

  get "tasks/show_overdue_tasks/:overdue_id" => "tasks#show_tasks", as: "show_overdue_tasks"
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
