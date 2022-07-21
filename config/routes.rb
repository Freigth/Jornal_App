Rails.application.routes.draw do
  devise_for :users
  # FOR SIGN_UP REDIRECT
  get '/users', to: redirect('/users/sign_up')

  # ERRORS
  # get '*path' => redirect('/')

  # root "articles#index"

  root 'categories#index'

  # CUSTOM TASKS ROUTE
  get "tasks/show_overdue_tasks/:overdue_id" => "tasks#show_tasks", as: "show_overdue_tasks"
  get "tasks/today" => "tasks#today"
  get "tasks/overdue" => "tasks#overdue"

  # MAIN
  resources :categories do
    resources :tasks
  end

  # get 'categories' => 'categories#index'

  # get 'categories/:id' => 'categories#show'

  # get 'categories/new' => 'categories#new'

  # post 'categories' => 'categories#create'

end
