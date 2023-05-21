module Api
  module V1
    class SharesController < ApplicationController
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

      def load_uid
        @user = User.find_by(uid: @payload["user_id"])
      end
    end
  end
end
