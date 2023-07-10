module Api::V1
  class BaseController < ApplicationController
    before_action :load_uid

    def load_uid
      @user = User.find_by(uid: @payload["user_id"])
    end
  end
end
