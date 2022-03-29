class RetweetsController < ApplicationController
  before_action :set_tweet

  def create
    @tweet.retweets.where(
      user: current_user
    ).first_or_create!

    @retweeted = true

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def destroy
    @tweet.retweets.where(
      user: current_user
    ).destroy_all

    @retweeted = false

    render :create
  end

  private

  # @tweet: tweet being retweeted
  def set_tweet
    @tweet = Tweet.find params[:id]
  end

end
