class CourseUsersController < ApplicationController
  if current_user.blank?
    flash[:error] = "請先登入才能進行此操作"
    redirect_to landing_page_path
  else
  	def show
  		@courses_simulator_item = UserCourse.includes(:user).where(course_code: params[:id])
  		@users = @courses_simulator_item.map(&:user)
  		render json: @users
  	end
  end
end
