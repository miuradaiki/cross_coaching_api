class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    questions = Question.all
    render json: questions, status: :ok
  end

  def show
    question = Question.find(params[:id])
    render json: question, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Question not found" }, status: :not_found
  end
end
