class Api::V1::NewsController < ApplicationController
  def index
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
    render json: @news
  end
end
