class UserFollowedUserController < ApplicationController
  def index
    if current_user
      @user_followed_users = current_user.user_followed_users
    else
      flash[:error] = "請先登入才能進行此操作"
      redirect_to root_path
    end
  end

  def create
    @user_followed_user = current_user.user_followed_users.new(user_followed_user_params)
    respond_to do |format|
      if @user_followed_user.save
        format.json {
          render json:{
            user_followed_user: @user_followed_user
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @user_followed_user = current_user.user_followed_users.find(params[:id])
    @user_followed_user.destroy
    respond_to do |format|
      format.json {
        render json:{
          status: "Item was successfully destroyed.",
          user_followed_user: @user_followed_user
        }
      }
    end
  end

  private

  def user_followed_user_params
    params.require(:user_followed_users).permit(:followed_user_id)
  end
end
