class SearchController < ApplicationController
  def index
    if params[:query].present?
      @users = User.where('name like :q or email like :q or uid like :q', q: "%#{params[:query]}%")
      @users = @users.limit(10)
    else
      @users = []
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
