Rails.application.routes.draw do
  # テスト用のルーティングを追加
  scope "api" do
    scope "v1" do
      get "/test", to: "application#test"
    end
  end

  # API用のルーティング
  namespace "api" do
    namespace "v1" do
      resource :users, only: [:create, :destroy]
    end
  end
end
