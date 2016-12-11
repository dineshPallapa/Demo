Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deals do 
    resources :surveys
  end
  root to: 'deals#index'
  get 'searchable' => 'deals#searchable'
end
