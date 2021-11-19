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
        if @post.save
            redirect_to root_path, notice: "投稿に成功しました!"
        else
            render :new
        end
    end
    
    def update
        if @post.update(post_params)
            redirect_to root_path, notice: "投稿を更新しました!"
        else
            render :edit
        end
    end

    def destroy
        if @post.destroy
            redirect_to root_path, notice: "投稿を削除しました!"
        else
            redirect_to root_path, alert: "投稿を削除しました!"
        end
    end
    

    private
        def find_post
            @post=Post.find(params[:id])
        end
end
