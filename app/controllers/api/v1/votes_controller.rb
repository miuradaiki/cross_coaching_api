module Api
  module V1
    class VotesController < ApplicationController
      def create
        load_uid
        if @user
          vote = Vote.new(vote_params.merge(user_id: @user.id))
          if vote.save
            render json: vote, status: :created
          else
            render json: { errors: vote.errors }, status: :unprocessable_entity
          end
        else
          render json: { error: "ユーザーが見つかりませんでした。" }, status: :not_found
        end
      end

      def voted_feedbacks
        load_uid
        if @user
          voted_feedback_ids = Vote.where(user_id: @user.id).pluck(:feedback_id)
          render json: voted_feedback_ids, status: :ok
        else
          render json: { error: "ユーザーが見つかりませんでした。" }, status: :not_found
        end
      end

      private

      def vote_params
        params.permit(:feedback_id, :vote_type)
      end

      def load_uid
        @user = User.find_by(uid: @payload["user_id"])
      end
    end
  end
end
