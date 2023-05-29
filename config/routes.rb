Rails.application.routes.draw do
  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resources :users, only: [:create, :edit, :destroy]
      # ユーザー削除（id送れずuidを送るため別で設定）
      delete "users", to: "users#destroy"
      resources :feedbacks
      resources :answers
      resources :questions
      resources :shares
      resources :votes
      # ユーザー情報編集
      get "profile", to: "users#edit"
      # 投票済みfeedback取得
      get "votes/voted_feedbacks/:user_id", to: "votes#voted_feedbacks"
      get "/my_feedbacks",  to: "feedbacks#my_feedbacks"
    end
  end
end
