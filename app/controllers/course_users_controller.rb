class CourseUsersController < ApplicationController
	def show
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
  		@courses_simulator_item = UserCourse.includes(:user).where(course_code: params[:id])
  		@users = @courses_simulator_item.map(&:user)
      course_male_counter = 0
      course_female_counter = 0

      @users.each do |u|
        if u.gender == 'male'
          course_male_counter = course_male_counter + 1
        else
          if u.gender == 'female'
            course_female_counter = course_female_counter + 1
          end
        end
      end

      respond_to do |format|
        format.json {  render json: {
          course_users: @users,
          course_male_counter: course_male_counter,
          course_female_counter: course_female_counter
          }
        }
      end
  	end
  end
end
