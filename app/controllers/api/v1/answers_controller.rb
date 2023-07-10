class Api::V1::AnswersController < Api::V1::BaseController
  def index
    answers = Answer.all
    render json: answers, status: :ok
  end

  def show
    question = Question.find(params[:id])
    answer = Answer.where(user_id: @user.id, question_id: question.id).first
    render json: answer, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Answer not found" }, status: :not_found
  end

  def create
    answer = Answer.new(answer_params)
    answer.user_id = @user.id
    answer.save!
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_id, :description, :question_id)
  end
end
