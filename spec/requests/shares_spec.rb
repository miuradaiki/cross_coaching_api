require 'rails_helper'

RSpec.describe "Shares", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shares/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/shares/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/shares/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/shares/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/shares/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
