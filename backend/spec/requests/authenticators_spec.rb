require 'rails_helper'

RSpec.describe "Authenticators", type: :request do
  describe "GET /authenticators" do
    it "works! (now write some real specs)" do
      get authenticators_path
      expect(response).to have_http_status(200)
    end
  end
end
