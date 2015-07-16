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

  def search
    name = "%" + params[:name] + "%"
    @found_user = User.where("name LIKE ?", name)

    respond_to do |format|
      if @found_user
        format.json { render json:
          {
            found_user: @found_user
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end
end
