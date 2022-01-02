RSpec.describe "Staticpages", type: :request do
    let(:base_title) { 'Ruby on Rails Tutorial Sample App' }
    describe "GET /" do
      it "returns http success" do
        get "/"
        aggregate_failures do
          expect(response).to have_http_status(:success)
          expect(response.body).to include base_title
          expect(response.body).to_not include "| #{base_title}"
        end
      end
    end
end