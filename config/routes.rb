Rails.application.routes.draw do
  require 'sidekiq/web' 
  mount Sidekiq::Web => '/sidekiq'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  devise_scope :user do
      root 'devise/sessions#new'
  end

  mount CmAdmin::Engine => "/admin"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
