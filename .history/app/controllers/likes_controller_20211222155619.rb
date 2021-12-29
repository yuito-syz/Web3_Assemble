class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @micropost = Micropost.find(params[:micropost_id])
        unless @micropost.liked?(current_user)
            @micropost.liked(current_user)
            respond_to do |format|
              format.html { redirect_to request.referrer || root_url }
              format.js
            end
        end
    end
      
    def delete
        @micropost = Like.find(params[:id]).micropost
        if @micropost.liked?(current_user)
            @micropost.unliked(current_user)
            respond_to do |format|
              format.html { redirect_to request.referrer || root_url }
              format.js
            end
        end
    end
end
