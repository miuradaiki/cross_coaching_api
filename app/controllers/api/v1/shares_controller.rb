module Api
  module V1
    class SharesController < ApplicationController
      def index
        answers = Share.includes(:answer).map(&:answer)
        render json: answers, status: :ok
      end

      def show
      end

      def create
        share = Share.new(share_params)
        share.user = User.find_by(uid: share_params[:user_id])
        share.save!
      end

      def update
      end

      def destroy
      end

      private

      def share_params
        params.require(:share).permit(:user_id, :answer_id)
      end
    end
  end
end
