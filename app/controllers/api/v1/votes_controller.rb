module Api
  module V1
    class VotesController < ApplicationController
      def create
        # TODO:既にレコードがある場合のエラーハンドリング
        user = User.find_by(uid: params[:user_id])
        Vote.create(feedback_id: params[:feedback_id], user_id: user.id, vote_type: params[:vote_type])
      end

      def voted_feedbacks
        user = User.find_by(uid: params[:user_id])
        voted_feedback_ids = Vote.where(user_id: user.id).pluck(:feedback_id)

        render json: voted_feedback_ids, status: :ok
      end
    end
  end
end

