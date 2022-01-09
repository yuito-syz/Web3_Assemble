require 'rails_helper'

RSpec.describe "Staticpages", type: :request do
  let(:base_title) { 'Ruby on Rails Tutorial' }

  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response.body).to include base_title
      expect(response.body).not_to include "| #{base_title}"
    end
  end

  describe "GET /help" do
    it "returns http success" do
      get "/help"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Help | #{base_title}"
    end
  end
  describe "GET /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "About | #{base_title}"
    end
  end
end