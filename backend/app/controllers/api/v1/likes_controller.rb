class Api::V1::LikesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    render json: Like.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
  end

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    render json: post
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    render json: post
  end

  private

  # def likes_params
  #   params.require(:like).permit(:post_id)
  # end
end
