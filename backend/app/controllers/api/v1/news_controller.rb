class Api::V1::NewsController < ApplicationController
  require 'news-api'

  def index
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
    render json: @news
  end

  def web3
    web3 = News.new(ENV['NEWS_API_KEY'])
    @web3 = web3.get_top_headlines(q: 'web3',
                                  sources: 'bbc-news,the-verge',
                                  category: 'business',
                                  language: 'en',
                                  country: 'us')
  end

  def metaverse
  end

  def METAMASK
  end

  def DeFi
  end

  def NFT
  end

  def DAO
  end

end
