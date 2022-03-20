class Api::V1::Auth::UsersController < ApplicationController
    def show
        render json: current_user.my_json
    end

    def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render json: @users
    end
  
    def followers
      @user  = User.find(params[:id])
      @users = @user.followers
      render json: @users
    end
end
