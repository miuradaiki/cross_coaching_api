Rails.application.routes.draw do
  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resources :users, only: [:create, :edit, :destroy]
      resources :feedbacks
      resources :answers
      resources :questions
      resources :shares
    end
  end
end
