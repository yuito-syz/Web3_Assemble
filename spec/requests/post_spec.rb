require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  describe "ログイン済" do
    describe "GET /posts" do
      it "投稿の一覧を取得できること" do
        user = create(:user)
        post = create(:post, user: user)
        login user

        get "/posts"

        expect(response).to have_http_status(:success)
        post_json = JSON.parse(response.body).first
        expect(post_json["id"]).to eq post.id
        expect(post_json["title"]).to eq post.title
        expect(post_json["body"]).to eq post.body
        expect(post_json["created_at"]).to eq post.created_at.iso8601(3)
        expect(post_json["user_name"]).to eq post.user.name
      end
    end
    describe "GET /posts/:id" do
      it "投稿の詳細を取得できること" do
        user = create(:user)
        post = create(:post, user: user)
        login user

        get "/posts/#{post.id}"

        expect(response).to have_http_status(:success)
        post_json = JSON.parse(response.body)
        expect(post_json["id"]).to eq post.id
        expect(post_json["title"]).to eq post.title
        expect(post_json["body"]).to eq post.body
        expect(post_json["created_at"]).to eq post.created_at.iso8601(3)
        expect(post_json["user_name"]).to eq post.user.name
      end
    end
    describe "POST /posts" do
      it "投稿を作成できること" do
        user = create(:user)
        login user
        params = attributes_for :post

        post "/posts", params: params

        expect(response).to have_http_status(:success)
        post_json = JSON.parse(response.body)
        post = Post.find(post_json["id"])
        expect(post_json["id"]).to eq post.id
        expect(post_json["title"]).to eq post.title
        expect(post_json["body"]).to eq post.body
        expect(post_json["created_at"]).to eq post.created_at.iso8601(3)
        expect(post_json["user_name"]).to eq post.user.name
      end
    end
    describe "PATCH /posts/:id" do
      it "投稿を更新できること" do
        user = create(:user)
        post = create(:post, user: user)
        login user
        params = attributes_for :post

        patch "/posts/#{post.id}", params: params

        expect(response).to have_http_status(:success)
        post_json = JSON.parse(response.body)
        _post = Post.find(post_json["id"])
        expect(post_json["id"]).to eq _post.id
        expect(post_json["title"]).to eq _post.title
        expect(post_json["body"]).to eq _post.body
        expect(post_json["created_at"]).to eq _post.created_at.iso8601(3)
        expect(post_json["user_name"]).to eq _post.user.name
      end
    end
  end

  describe "未ログイン" do
    it "投稿一覧にアクセスができないこと" do
      user = create(:user)
      post = create(:post, user: user)

      get "/posts"

      expect(response.status).to eq 401
    end
  end
end