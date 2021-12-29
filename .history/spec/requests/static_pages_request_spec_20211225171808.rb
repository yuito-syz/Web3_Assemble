require 'rails_helper'

RSpec.describe "Staticpages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Home | Ruby on Rails Tutorial Sample App"
    end
  end
  describe "GET /home" do
    it "returns http success" do
      get "/staticpages/home"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Home | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /help" do
    it "returns http success" do
      get "/staticpages/help"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Help | Ruby on Rails Tutorial Sample App"
    end
  end
  describe "GET /about" do
    it "returns http success" do
      get "/staticpages/about"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "About | Ruby on Rails Tutorial Sample App"
    end
  end
end