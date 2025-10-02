# frozen_string_literal: true

module Mobile::Types
  class MutationType < Mobile::Types::BaseObject
    field :create_todo, mutation: Mobile::Mutations::Todo::CreateTodo
    field :update_todo, mutation: Mobile::Mutations::Todo::UpdateTodo
    field :delete_todo, mutation: Mobile::Mutations::Todo::DeleteTodo

    # 認証関連
    field :sign_up, mutation: Mobile::Mutations::Auth::SignUp
    field :sign_in, mutation: Mobile::Mutations::Auth::SignIn
    field :sign_out, mutation: Mobile::Mutations::Auth::SignOut

    # バックグラウンドジョブ関連
    field :trigger_background_job, mutation: Mobile::Mutations::TriggerBackgroundJob
  end
end
