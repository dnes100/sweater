class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @tweets = @user.tweets.where(parent_id: nil)

    # Stores ids of liked tweets to reduce db queries
    @liked_tweet_ids = current_user.likes.where(tweet: @tweets).pluck(:tweet_id)
  end
end
