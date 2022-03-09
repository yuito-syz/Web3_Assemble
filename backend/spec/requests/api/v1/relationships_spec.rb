require 'rails_helper'

RSpec.describe "Api::V1::Relationships", type: :request do
  describe "GET /followings" do
    it "returns http success" do
      get "/api/v1/relationships/followings"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followers" do
    it "returns http success" do
      get "/api/v1/relationships/followers"
      expect(response).to have_http_status(:success)
    end
  end

end
