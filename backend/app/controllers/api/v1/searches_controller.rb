class Api::V1::SearchesController < ApplicationController
    def search
        p params[:keyword]
        keyword = search_params[:keyword]
        if keyword.present?
            data = {}
            data[:posts] = Post.search(params[:keyword])
            data[:users] = User.search(params[:keyword])
            render json: data
        else
            render json:{message: '検索キーワードがありません'}
        end
    end 
end
