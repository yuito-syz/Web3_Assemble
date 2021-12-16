class LikesController < ApplicationController
    def create
        @like = Like.new(user_id: @current_user.id, food_id: params[:food_id])
        @like.save
        @food = Food.find_by(id: @like.food_id)
        @like_count = Like.where(food_id: params[:food_id]).count
    end
      
    def delete
        @like = Like.find_by(user_id: @current_user.id, food_id: params[:food_id])
        @food = Food.find_by(id: @like.food_id)
        @like.destroy
        @like_count = Like.where(food_id: params[:food_id]).count
    end
end
