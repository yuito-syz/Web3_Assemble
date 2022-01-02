require 'rails_helper'

RSpec.describe "Staticpages", type: :request do
  describe "GET /help" do
    it "returns http success" do
      get "/help"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Help | Ruby on Rails Tutorial"
    end
  end
  describe "GET /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "About | Ruby on Rails Tutorial"
    end
  end
end