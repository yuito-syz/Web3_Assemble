class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @micropost = Micropost.find(params[:micropost_id])
        @micropost.liked(current_user)
    end
      
    def delete
        @micropost = Like.find(params[:id]).micropost
        @micropost.unliked(current_user)
    end
end
