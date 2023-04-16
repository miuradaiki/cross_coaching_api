Rails.application.routes.draw do
  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resources :users, only: [:create, :edit, :destroy]
      resources :feedbacks, only: [:edit, :create, :destroy]
      resources :answers
      resources :questions
      resources :shares, only: [:index]
    end
  end
end
