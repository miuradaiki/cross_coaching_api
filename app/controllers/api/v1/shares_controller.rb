module Api
  module V1
    class SharesController < ApplicationController
      def index
        shares = Share.all
        render json: shares, status: :ok
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
