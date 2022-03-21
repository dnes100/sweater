class FollowsController < ApplicationController
  before_action :set_following

  def create
    current_user.follows.where(
      following: @following
    ).first_or_create!

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def destroy
    current_user.follows.where(
      following: @following
    ).destroy_all

    render :create
  end

  private

  # @following: user being followed
  def set_following
    @following = User.find params[:id]
  end

end
