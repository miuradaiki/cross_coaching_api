class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:create]

  # 新規ユーザー登録
  def create
    uid = params[:uid]
    email = params[:email]
    @user = User.new(uid: uid, email: email)
    if @user.save
      render json: @user
    else
      render json: { error: { messages: ["新規ユーザーを登録できませんでした。"] } }, status: unprocessable_entity
    end
  end

  # ユーザーの削除
  def destroy
    User.find_by(uid: @user.uid).destroy
    render json: { messages: ["ユーザーを削除しました。"] }
  end

  def edit
    profiles = {
      uid: @user.uid,
      first_name: @user.first_name,
      last_name: @user.last_name,
      email: @user.email
    }
    render json: profiles, status: :ok
  end
end
