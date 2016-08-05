Rails.application.routes.draw do
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'home'   => 'static_pages#home'

  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id(.:format)))', :via => :all
  resources :events
  root 'welcome#index'
  get 's' => 'welcome#index'
  get 'req' => 'welcome#req'
  get 'res' => 'welcome#res'
  get 't' => 'welcome#tests'

  #api route
  namespace :api do
  namespace :v1 do
    resources :users, only: [:index, :create, :show, :update, :destroy]
    resources :sessions, only: [:create]
    # 原文有 microposts, 我们现在把它注释掉
    # resources :microposts, only: [:index, :create, :show, :update, :destroy]
  end
end
end
