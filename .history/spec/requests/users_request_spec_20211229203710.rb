require 'rails_helper'

RSpec.describe "Users", type: :request do
・・・
  describe "POST /users" do
    let(:user) { FactoryBot.attributes_for(:user) }  #<= attributes_forはハッシュの形で返してくれる。
    it "adds new user with correct signup information" do
      aggregate_failures do
        expect do
          post users_path, params: { user: user } # <= paramsの中身はハッシュの形
        end.to change(User, :count).by(1)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_path(User.last)
      end
    end
  end
end