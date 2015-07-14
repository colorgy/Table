class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	    if current_user.blank?
	      redirect_to ask_login_path
	    else
		  @user = User.find(params[:id])
	      @courses_simulator_items = CoursesSimulatorItem.where(user_id: params[:id])
	    end
	end
end
