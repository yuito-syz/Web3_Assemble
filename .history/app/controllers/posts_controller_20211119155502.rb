class PostsController < ApplicationController
    before_actions :find_posts, only[:show, :edit, :update, :destroy]

    def index
    end
    
    def show
    end

    def new
    end

    def edit
    end

    def create
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
