class CommentsController < ApplicationController
    protect_from_forgery except: [:create]

  def create
    @micropost = Microost.find_by(params[:micropost_id])
    @comments = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      micropost_id: @micropost.id
    )

    if @comments.save

      flash[:notice] = 'コメントを作成しました'
      redirect_to("/microposts/#{params[:micropost_id]}")
    else
      flash[:notice] = 'コメントの作成に失敗しました'
      redirect_to("/microposts/#{params[:micropost_id]}")
    end
  end

  def destroy
    @micropost = Micropost.find_by(params[:micropost_id])
    @comments = Comment.find_by(params[:id])
    @comments.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to("/microposts/#{params[:micropost_id]}")
  end
end
