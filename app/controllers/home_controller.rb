class HomeController < ApplicationController
  def index
    @tweets = Tweet.where(user: current_user.followings)
                   .or(Tweet.where(user: current_user))

    # Stores ids of liked tweets to reduce db queries
    @liked_tweet_ids = current_user.likes.where(tweet: @tweets).pluck(:tweet_id)
  end
end
