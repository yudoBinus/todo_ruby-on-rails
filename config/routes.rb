Rails.application.routes.draw do
  get 'todos/index'
  get 'todos/:id/update_form' => "todos#update_form"
  post 'todos/new' => 'todos#new'
  post 'todos/:id/destroy' => 'todos#destroy'
  post 'todos/:id/update' => 'todos#update'
  post 'todos/:id/update_status' => 'todos#update_status'

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
