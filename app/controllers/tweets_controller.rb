class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.create! tweet_params

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
