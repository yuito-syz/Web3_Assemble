class PostsController < ApplicationController

    private
        def find_posts
            @post=Post.find(params[:id])
        end
end
