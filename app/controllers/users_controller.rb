class UsersController < ApplicationController
  def index
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      @users = User.all.paginate(:page => params[:page], :per_page => 25)
      @user_followed_users = current_user.user_followed_users
    end
  end

  def show
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      @user = User.find(params[:id])
      @user_courses = UserCourse.where(user_id: params[:id])
      @user_followed_users = current_user.user_followed_users
    end
  end

  def search

    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      name = "%" + params[:name] + "%"
      @found_user = User.where("lower(name) LIKE ?", name.downcase)

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
end
