class HomeController < ApplicationController
  def index

    # TODO: For retweet, we need to allow parent_id not nil as well.
    # TODO: Select user_id who retweeted that tweet.
    @tweets = Tweet.where(user: current_user.followings)
      .or(Tweet.where(user: current_user))
      .where(parent_id: nil)
      .or(Tweet.where(id: Retweet.where(user: current_user.followings).select(:tweet_id)))


    # Stores ids of liked tweets to reduce db queries
    @liked_tweet_ids = current_user.likes.where(tweet: @tweets).pluck(:tweet_id)

    # @retweeted_tweet_ids = current_user.retweets.where(tweet: @tweets).pluck(:tweet_id)
    # NOTE: This structure has to be same as in other controllers using same view partials.
    # TODO: For tweets with multiple retweets, only last one will be considered by this logic?
    @retweets_per_tweet_id =
      Retweet.where(
        user: User.where(id: current_user).or(User.where(id: current_user.followings))
      )
      .joins(:user)
      .select("*", "users.name as user_name")
      .index_by(&:tweet_id)
  end
end
