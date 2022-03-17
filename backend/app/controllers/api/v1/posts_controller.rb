class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Post.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    @post = Post.find_by(id: params[:id])

    unless @post
      render json: @post, status: 500
    end
  end

  def create
    post = Post.new((content: params[:post][:content]))
    if post.save
      render json: '作成に成功しました', status: 200
    else
      render json: '作成に失敗しました', status: 500
    end
  end

  def update
    post = Post.find_by(id: params[:id])
    if post.update(content: params[:post][:content])
      render json: '更新に成功しました', status: 200
    else
      render json: '更新に失敗しました', status: 500
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: '削除に成功しました', status: 200
    else
      render json: '削除に失敗しました', status: 500
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :body)
  end
end