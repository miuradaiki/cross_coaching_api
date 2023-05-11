Rails.application.routes.draw do
  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resources :users, only: [:create, :edit, :destroy]
      resources :feedbacks
      resources :answers
      resources :questions
      resources :shares
      resources :votes
      # 投票済みfeedback取得
      get "votes/voted_feedbacks/:user_id", to: "votes#voted_feedbacks"
    end
  end
end
