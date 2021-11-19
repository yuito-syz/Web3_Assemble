class PostsController < ApplicationController
    before_actions :find_posts, only[]

    private
        def find_posts
            @post=Post.find(params[:id])
        end
end
