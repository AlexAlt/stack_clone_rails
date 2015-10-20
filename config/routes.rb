Rails.application.routes.draw do
  root :to => 'home#index'

  resources :users do
    resources :questions
  end

  resources :users do
    resources :answers
  end

  resources :questions do
    resources :answers
  end


  resources :sessions

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
