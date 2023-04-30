module Api
  module V1
    class VotesController < ApplicationController
      def create
        user = User.find_by(uid: params[:user_id])
        Vote.create(feedback_id: params[:feedback_id], user_id: user.id, vote_type: params[:vote_type])
      end
    end
  end
end

