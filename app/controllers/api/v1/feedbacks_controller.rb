module Api
  module V1
    class FeedbacksController < ApplicationController
      before_action :load_uid

      def index
        share = Share.find(params[:id])
        feedbacks = Feedback.where(answer_id: share.answer_id).order(created_at: :desc)

        feedbacks_data = feedbacks.map do |feedback|
          total_up_votes = feedback.up_votes
          total_down_votes = feedback.down_votes
          total_votes = feedback.total_votes
          {
            id: feedback.id,
            description: feedback.description,
            created_at: feedback.created_at,
            total_up_votes: feedback.up_votes,
            total_down_votes: feedback.down_votes,
            total_votes: feedback.total_votes
          }
        end

        render json: feedbacks_data, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Feedbacks not found" }, status: :not_found
      end

      def show
        share = Share.find(params[:id])
        answer = Answer.find(share.answer_id)
        feedback = Feedback.find_by(answer_id: answer.id)

        render json: feedback, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Feedback not found" }, status: :not_found
      end

      def create
        feedback = Feedback.new(feedback_params)
        user = User.find_by(uid: feedback_params[:user_id])
        feedback.user_id = user.id
        feedback.save!

        render status: :ok
      end

      def my_feedbacks
        # feedbackをつけたanswerを取得
        feedbacks = Feedback.where(user_id: @user.id).includes(:answer)
        feedbacks_with_answers = feedbacks.map do |feedback|
          {
            feedback_id: feedback.id,
            feedback_description: feedback.description,
            answer_id: feedback.answer.id,
            answer_description: feedback.answer.description
          }
        end
        render json: feedbacks_with_answers, status: :ok
      end

      private

      def feedback_params
        params.require(:feedback).permit(:answer_id, :description, :user_id)
      end

      def load_uid
        @user = User.find_by(uid: @payload["user_id"])
      end
    end
  end
end