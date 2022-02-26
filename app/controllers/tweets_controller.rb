class TweetsController < ApplicationController

  def create
    current_user.tweets.create! tweet_params

    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
