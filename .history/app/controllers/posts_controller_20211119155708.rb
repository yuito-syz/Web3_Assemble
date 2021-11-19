class PostsController < ApplicationController
    before_actions :find_post, only[:show, :edit, :update, :destroy]

    def index
        @post = Post.all
    end
    
    def show
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
    end
    
    def update
    end

    def destroy
        
    end
    end

    private
        def find_post
            @post=Post.find(params[:id])
        end
end
