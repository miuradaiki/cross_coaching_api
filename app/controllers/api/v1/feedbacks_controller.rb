module Api
  module V1
    class FeedbacksController < ApplicationController
      def index
        share = Share.find(params[:id])
        feedbacks = Feedback.where(answer_id: share.answer_id).order(created_at: :desc)

        render json: feedbacks, status: :ok
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

      def update
      end

      def destroy
      end

      def feedback_params
        params.require(:feedback).permit(:answer_id, :description, :user_id)
      end
    end
  end
end