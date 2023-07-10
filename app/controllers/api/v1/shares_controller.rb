class Api::V1::SharesController < Api::V1::BaseController
  def index
    shares = Share.all
    render json: shares, status: :ok
  end

  def create
    share = Share.new(share_params)
    share.user = @user.id
    share.save!
  end

  private

  def share_params
    params.require(:share).permit(:answer_id)
  end
end
