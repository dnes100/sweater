class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :like, :unlike]

  def create
    @tweet = current_user.tweets.create! tweet_params

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def show
    # Stores ids of liked tweets to reduce db queries
    @liked_tweet_ids = current_user.likes.where(tweet: @tweet)
      .or(current_user.likes.where(tweet: @tweet.replies))
      .pluck(:tweet_id)
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@tweet) }
      format.html { redirect_to root_path }
    end
  end

  def like
    @tweet.likes.create! user: current_user
    @liked = true

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def unlike
    @tweet.likes.where(user: current_user).destroy_all
    @liked = false

    render :like
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content, :parent_id)
  end
end
