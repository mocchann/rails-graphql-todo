Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    require 'sidekiq/web'
    mount Sidekiq::Web => "/sidekiq"
  end
  post "/graphql", to: "graphql#execute"
  get "up" => "rails/health#show", as: :rails_health_check
end
