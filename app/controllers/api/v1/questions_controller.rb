module Api
  module V1
    class QuestionsController < ApplicationController
      def index
      end

      def show
        questions = Question.all
        render json: questions
      end
    end
  end
end
