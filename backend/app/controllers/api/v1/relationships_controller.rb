class Api::V1::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    render json: @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    render json: @user
  end
end
