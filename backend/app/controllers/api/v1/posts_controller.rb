class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.published.page(params[:page]).reverse_order
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])

    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(7).reverse_order

    unless @post
      render json: @post, status: 500
    end

    unless @comments
      render json: @comments, status: 500
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

  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    # params.permit(:title, :body)
    params.require(:post).permit(:location, :text, :image, :status)
  end
end