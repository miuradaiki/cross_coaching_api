module Api
  module V1
    class UsersController < ApplicationController
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
        uid = params[:uid]
        User.find_by(uid: uid).destroy
        render json: { messages: ["ユーザーを削除しました。"] }
      end
    end
  end
end