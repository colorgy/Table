class UsersController < ApplicationController
  def index
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      #@users = User.all
      @user_followed_users = current_user.user_followed_users
      @users = User.all.paginate(:page => params[:page], :per_page => 25)
      name = "%" + params[:name] + "%" if params[:name].present?
      organization_code = params[:organization_code] if params[:organization_code].present?
      gender = params[:gender] if params[:gender].present?
      started_year = params[:started_year] if params[:started_year].present?
      @users = @users.where("lower(name) LIKE ?", name.downcase).paginate(:page => params[:page], :per_page => 25) if params[:name].present? && params[:name] != '' && params[:name] != 'undefined'
      @users = @users.where("organization_code LIKE ?", organization_code).paginate(:page => params[:page], :per_page => 25) if params[:organization_code].present? && params[:organization_code] != 'all'
      @users = @users.where("gender LIKE ?", gender).paginate(:page => params[:page], :per_page => 25) if params[:gender].present? && params[:gender] != 'all'
      @users = @users.where("started_year = ?", started_year).paginate(:page => params[:page], :per_page => 25) if params[:started_year].present? && params[:started_year] != 'all'
    end
  end

  def show
    if current_user.blank?
      @user = User.find(params[:id])
      if @user.organization_code.blank? || @user.organization_code == ''
        flash[:error] = "這位使用者沒有進行 email 認證，沒有個人頁面"
        redirect_to :back
      else
        @user_courses = UserCourse.where(user_id: params[:id])
      end
    else
      if current_user.organization_code.blank? || current_user.organization_code == ''
        flash[:error] = "你沒有驗證學校 email，請至 https://colorgy.io/my-account/emails/new 進行驗證再回來～"
        redirect_to users_path
      else
        @user = User.find(params[:id])
        if @user.organization_code.blank? || @user.organization_code == ''
          flash[:error] = "這位使用者沒有進行 email 認證，沒有個人頁面"
          redirect_to users_path
        else
          @user_courses = UserCourse.where(user_id: params[:id])
          @user_followed_users = current_user.user_followed_users
        end
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "成功儲存隱私權設定"

    redirect_to :back
  end

  def search
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      name = "%" + params[:name] + "%"
      organization_code = "%" + params[:organization_code] + "%"
      @found_user = User.all
      @found_user = @found_user.where("lower(name) LIKE ?", name.downcase)
      @found_user = @found_user.where("organization_code LIKE ?", organization_code)

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

  def settings

  end

  def get_poll_sample

    gender = params[:gender] if params[:gender].present?
    @found_user = User.all.where(gender: gender)
    if params[:myschool].present?
      organization_code = params[:myschool]
      @found_user = User.all.where("gender = ? AND organization_code = ? ", gender, organization_code)
    end
    @found_user = @found_user.where(poll_anonymous: false)
    @found_user_fresh = @found_user.where(started_year: 2015).sample
    @found_user_not_fresh = @found_user.where("started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ? OR started_year = ?  ", 2014,2013,2012,2011,2010,2009,2008,2007,2006,2005).sample

    respond_to do |format|
      if @found_user_fresh && @found_user_not_fresh
        format.json { render json:
          {
            found_user_fresh: @found_user_fresh,
            found_user_not_fresh: @found_user_not_fresh
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def find_user_by_user_id
    user_id = params[:user_id]
    @user = User.find(user_id)
    respond_to do |format|
      if @user
        format.json { render json:
          {
            user: @user
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def shared_callback
    if current_user
      current_user.shared = true
      current_user.save!
    end

    render json: {}
  end

  def subscribed_callback
    if current_user
      current_user.subscribed = true
      current_user.save!
    end

    render json: {}
  end

  def first_login_callback
    if current_user
      current_user.first_login = false
      current_user.save!
    end

    render json: {}
  end


  private
  def user_params
    params.require(:user).permit(:fb_visibility, :courses_table_visibility, :courses_table_visibility_for_guests, :poll_anonymous)
  end
end
