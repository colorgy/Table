class UsersController < ApplicationController
  def index
    @users = User.all
    @user_followed_users = current_user.user_followed_users
  end

  def show
    if current_user.blank?
      redirect_to ask_login_path
    else
      @user = User.find(params[:id])
      @user_courses = UserCourse.where(user_id: params[:id])
      @user_followed_users = current_user.user_followed_users
    end
  end
end
