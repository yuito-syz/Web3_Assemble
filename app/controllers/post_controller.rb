class PostController < ApplicationController
    def index
        @posts = Post.eager_load(:user).with_attached_icatch
      end
    
    def post_params
        params.permit(:title, :body, :icatch).merge(user: current_user)
    end
end
