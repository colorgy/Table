class CourseUsersController < ApplicationController

	def show
		@courses_simulator_item = CoursesSimulatorItem.includes(:user).where(course_code: params[:id])
		@users = @courses_simulator_item.map(&:user)
		render json: @users
	end

end
