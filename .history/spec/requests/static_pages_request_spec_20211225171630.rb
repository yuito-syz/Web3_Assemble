require 'rails_helper'

RSpec.describe "Staticpages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/staticpages/home"
      expect(response).to have_http_status(:success)
#以下の一文を追加
      expect(response.body).to include "Home | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /help" do
    it "returns http success" do
      get "/staticpages/help"
      expect(response).to have_http_status(:success)
#以下の一文を追加
      expect(response.body).to include "Help | Ruby on Rails Tutorial Sample App"
    end
  end
