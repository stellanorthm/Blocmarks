class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user.present?
      @user = params[:id] ? User.find(params[:id]) : current_user
      @user_bookmarks = @user.bookmarks
      @liked_bookmarks = @user.likes
    end
  end
end
