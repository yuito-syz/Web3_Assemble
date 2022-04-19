class Api::V1::HeadlinesController < ApplicationController
  require 'news-api'

  def index
    headlines = News.new(ENV['NEWS_API_KEY'])
    @headlines = headlines.get_top_headlines(country: 'jp')
    render json: @headlines
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
