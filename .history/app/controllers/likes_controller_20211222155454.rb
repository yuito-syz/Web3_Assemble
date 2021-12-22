class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @micropost = Micropost.find(params[:micropost_id])
        @micropost.liked(current_user)
        unless @micropost.iine?(current_user)
            @micropost.iine(current_user)
            respond_to do |format|
              format.html { redirect_to request.referrer || root_url }
              format.js
            end
        end
    end
      
    def delete
        @micropost = Like.find(params[:id]).micropost
        @micropost.unliked(current_user)
    end
end
