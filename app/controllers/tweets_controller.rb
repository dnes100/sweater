class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.create! tweet_params

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@tweet) }
      format.html { redirect_to root_path }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :parent_id)
  end
end
