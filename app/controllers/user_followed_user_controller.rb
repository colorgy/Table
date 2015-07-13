class UserFollowedUserController < ApplicationController
  def index
    @user_followed_users = current_user.followed_users
    @user = User.all
  end

  def create
    @user_followed_user = current_user.user_followed_users.new(user_followed_user_params)
      respond_to do |format|
        if @user_followed_user.save
          format.html { redirect_to :back, notice: 'Add to wish list successfully!' }
        else
          format.html { redirect_to :back, notice: 'Add to wish list failed!' }
        end
      end
  end

  def destroy
    @user_followed_user = current_user.user_followed_users.find(params[:id])
    @user_followed_user.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Item was successfully destroyed.' }
      end
  end

  private

  def user_followed_user_params
    params.require(:user_followed_users).permit(:followed_user_id)
  end
end
