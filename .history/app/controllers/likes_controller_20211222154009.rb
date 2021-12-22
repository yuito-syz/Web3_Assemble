class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @micropost = Micropost.find_by(id: @like.micropost_id)
        @like_count = Like.where(micropost_id: params[:micropost_id]).count
        @micropost = Micropost.find(params[:micropost_id])
        @micropost.iine(current_user)
    end
      
    def delete
        @like = Like.find_by(user_id: @current_user.id, micropost_id: params[:micropost_id])
        @micropost = Micropost.find_by(id: @like.micropost_id)
        @like.destroy
        @like_count = Like.where(micropost_id: params[:micropost_id]).count
    end
end
