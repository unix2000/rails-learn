Rails.application.routes.draw do
  get 'sessions/new'

  use_doorkeeper
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'home'   => 'static_pages#home'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :people
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id(.:format)))', :via => :all
  resources :events
  root 'welcome#index'
  get 's' => 'welcome#index'
  get 'req' => 'welcome#req'
  get 'res' => 'welcome#res'
  get 't' => 'welcome#tests'
  get 'dir' => 'welcome#dirs'
  get 'test' => 'tests#index'
  get 'redis' => 'cache#redis'

  #api route
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
      scope path: '/user/:user_id' do
        resources :microposts, only: [:index]
      end
      # 原文有 microposts, 我们现在把它注释掉
      # resources :microposts, only: [:index, :create, :show, :update, :destroy]
    end

    namespace :v2 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
      scope path: '/user/:user_id' do
        resources :microposts, only: [:index]
      end
    end
    
  end

end
