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
      get "votes/feedback/:feedback_id/user/:user_id", to: "votes#check_vote"
    end
  end
end
