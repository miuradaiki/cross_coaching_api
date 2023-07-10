class Api::V1::VotesController < Api::V1::BaseController
  def create
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
end
