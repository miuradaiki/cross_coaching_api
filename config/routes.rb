Rails.application.routes.draw do
  # API用のルーティング
  namespace "api" do
    namespace "v1" , defaults: {format: :json} do
      resource :users, only: [:create, :edit, :destroy]
      resource :feedbacks, only: [:edit, :create, :destroy]
      resource :answers, only: [:show]
      resource :questions
      resource :shares
    end
  end
end
