Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  devise_for :admins
  devise_for :users, skip: [:sessions,:passwords]
    as :user do
      get 'login', to: 'devise/sessions#new', as: :new_user_session
      post 'login', to: 'devise/sessions#create', as: :user_session
      match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
      get 'forgotpassword', to: 'devise/passwords#new', as: :new_user_password
      post 'resetpassword', to: 'devise/passwords#create', as: :user_password
      get 'editpassword', to: 'devise/passwords#edit',  as: :edit_user_password
      get 'resetpassword', to: 'devise/passwords#new'
      patch 'resetpassword', to: 'devise/passwords#update'
      put 'resetpassword', to: 'devise/passwords#update'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deals do
    resources :surveys
  end
  root to: 'deals#index'
  get 'searchable' => 'deals#searchable'
end
