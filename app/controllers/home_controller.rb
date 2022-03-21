class HomeController < ApplicationController
  def index
    @tweets = Tweet.where(user: current_user.followings).or(Tweet.where(user: current_user))
  end
end
