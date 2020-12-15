Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#welcome'
  # get '/portal', to: "static_pages#portal" 
  # get '/portal', to: "users/sessions#new"
  get '/about-us', to: "static_pages#about-us"
  get '/home', to: "static_pages#portal"
  get '/calendar', to: "static_pages#events"
  get '/amortization', to: "static_pages#amortization"
  get '/links', to: "static_pages#links"
  
  resources :transactions, only: [:index, :create, :new, :update]
  resources :houses, only: [:index, :create, :new]
  resources :tasks
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/portal', to: "users/sessions#new"
    get '/register', to: "users/registrations#new"
    get '/sign-out', to: "users/sessions#destroy"
    # get '/home', to: "static_pages#portal"
  end  
end
