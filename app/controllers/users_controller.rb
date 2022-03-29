class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @tweets = @user.tweets.where(parent_id: nil)
      .or(Tweet.where(id: Retweet.where(user: @user).select(:tweet_id)))

    # Stores ids of liked tweets to reduce db queries
    @liked_tweet_ids = current_user.likes.where(tweet: @tweets).pluck(:tweet_id)

    # @retweeted_tweet_ids = current_user.retweets.where(tweet: @tweets).pluck(:tweet_id)

    # NOTE: This structure has to be same as in other controllers using same view partials.
    @retweets_per_tweet_id = current_user.retweets
      .joins(:user)
      .select("*", "users.name as user_name")
      .index_by(&:tweet_id)

  end
end
