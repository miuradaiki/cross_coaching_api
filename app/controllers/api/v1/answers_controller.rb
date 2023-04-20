module Api
  module V1
    class AnswersController < ApplicationController
      def index
        answers = Answer.all
        render json: answers, status: :ok
      end

      def show
        question = Question.find(params[:id])
        answer = Answer.find_by(question_id: question.id)
        render json: answer, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Answer not found" }, status: :not_found
      end

      def edit
      end

      def create
        answer = Answer.new(answer_params)
        answer.user = User.find_by(uid: answer_params[:user_id])
        answer.save!
      end

      def update
      end

      def destroy
      end

      private

      def answer_params
        params.require(:answer).permit(:answer_id, :description, :user_id)
      end
    end
  end
end
