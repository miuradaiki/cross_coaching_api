Rails.application.routes.draw do
  # テスト用のルーティングを追加
  # scope "api" do
  #   scope "v1" do
  #     get "/test", to: "application#test"
  #   end
  # end

  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resource :users, only: [:create, :edit, :destroy]
      resource :feedbacks, only: [:edit, :create, :destroy]
      resource :answers, only: [:show]
      resource :questions
      resource :shares

      # テスト用API
      resource :posts
    end
  end
end
