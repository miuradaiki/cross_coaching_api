module Api
  module V1
    class AnswersController < ApplicationController
      def index
        answers = Answer.all
        render json: answers, status: :ok
      end

      def show
        load_uid

        question = Question.find(params[:id])
        answer = Answer.where(user_id: @user.id, question_id: question.id).first
        render json: answer, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Answer not found" }, status: :not_found
      end

      def create
        answer = Answer.new(answer_params)

        load_uid
        answer.user_id = @user.id
        answer.save!
      end

      private

      def answer_params
        params.require(:answer).permit(:answer_id, :description, :question_id)
      end

      def load_uid
        @user = User.find_by(uid: @payload["user_id"])
      end
    end
  end
end
