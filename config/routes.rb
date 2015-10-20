Rails.application.routes.draw do
  root :to => 'home#index'

  resources :users do
    resources :questions do
      member do
        post :vote
      end
    end
  end

  resources :questions do
    resources :answers, :only => [:new, :create, :edit, :destroy, :update]
  end


  resources :sessions, :only => [:new, :create, :destroy]

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
