class HomeController < ApplicationController
  def index
    @media = Gram.all
    @tweets = Tweet.order("tweet_id desc").limit(3)
    @activities = Activity.all
    @article = Article.order("published_at desc").first
  end
  
  def about
  end
end
