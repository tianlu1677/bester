require 'sidekiq/web'
require 'sidekiq/cron/web'


Rails.application.routes.draw do
  mount Sidekiq::Web => '/admin/sidekiq'
  mount PgHero::Engine, at: '/admin/pghero'

  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions'#, only: [:create]

  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  # get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  # delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  root 'admin/home#index'

  post '/message', to: 'messages#message'

  # 管理后台
  namespace :admin do
    root 'home#index'
    resources :operation_logs
    resources :users
    resources :settings
    resources :chatbots
    resources :chat_tricks do
      member do
        post :delete_file
      end
    end
    resources :chat_rooms do
      resources :chat_actions do
        member do 
          post :delete_file          
        end
      end
    end
    resources :chat_contacts
    resources :chat_messages    
    resources :chat_actions do
      member do 
        post :push_now        
      end
    end
  end
end
