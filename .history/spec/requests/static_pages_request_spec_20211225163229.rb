describe "GET /about" do
    it "returns http success" do
      get "/staticpages/about"
      expect(response).to have_http_status(:success)
    end
end