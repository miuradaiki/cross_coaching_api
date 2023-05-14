module Api
  module V1
    class SharesController < ApplicationController
      def index
        shares = Share.all
        render json: shares, status: :ok
      end

      def create
        share = Share.new(share_params)
        share.user = User.find_by(uid: share_params[:user_id])
        share.save!
      end

      private

      def share_params
        params.require(:share).permit(:user_id, :answer_id)
      end
    end
  end
end
