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
      if !@user.organization_code || current_user.organization_code == ''
        flash[:error] = "這位使用者沒有進行 email 認證，沒有個人頁面"
        redirect_to users_path
      else
        @user = User.find(params[:id])
        @user_courses = UserCourse.where(user_id: params[:id])
      end
    else
      if !current_user.organization_code || current_user.organization_code == ''
        flash[:error] = "請先進行 email 認證"
        redirect_to 'https://colorgy.io/my_account/emails/new'
      else
        @user = User.find(params[:id])
        @user_courses = UserCourse.where(user_id: params[:id])
        @user_followed_users = current_user.user_followed_users
      end
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
