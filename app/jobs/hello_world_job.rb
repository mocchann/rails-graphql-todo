class HelloWorldJob
  include Sidekiq::Job

  def perform(name = "World")
    puts "Hello, #{name}! This is a background job running at #{Time.current}"
    
    # 実際のアプリケーションでは、ここでメール送信やデータ処理などを行います
    # 例：メール送信、ファイル処理、API呼び出しなど
    
    # デモ用に少し待機
    sleep(2)
    
    puts "Job completed for #{name}!"
  end
end
