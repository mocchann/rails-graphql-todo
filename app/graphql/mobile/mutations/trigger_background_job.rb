# frozen_string_literal: true

module Mobile::Mutations
  class TriggerBackgroundJob < Mobile::Mutations::BaseMutation
    description "バックグラウンドジョブを実行します"

    argument :name, String, required: false, description: "挨拶する名前（デフォルト: World）"

    field :success, Boolean, null: false, description: "ジョブが正常にキューに追加されたかどうか"
    field :message, String, null: false, description: "結果メッセージ"

    def resolve(name: "World")
      # バックグラウンドジョブをキューに追加
      HelloWorldJob.perform_async(name)

      {
        success: true,
        message: "バックグラウンドジョブがキューに追加されました！名前: #{name}"
      }
    rescue => e
      {
        success: false,
        message: "エラーが発生しました: #{e.message}"
      }
    end
  end
end
