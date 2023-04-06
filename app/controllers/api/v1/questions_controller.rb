module Api
  module V1
    class QuestionsController < ApplicationController
      def index
        questions = Question.all
        render json: questions
      end

      def show
        question_id = params[:id]
        questions = Question.find(question_id)
        render json: questions
      end
    end
  end
end
