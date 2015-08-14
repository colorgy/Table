class AskCoursesController < ApplicationController
  def index
    @ask_courses = AskCourse.all
  end

  def show
    @ask_course = AskCourse.find(params[:id])
  end

  def new
    @ask_course = AskCourse.new
  end

  def create
    @ask_course = AskCourse.new(ask_courses_params)

    if @ask_course.save
      redirect_to ask_courses_path
    else
      render 'new'
    end

  end

  def destroy
    @ask_course = AskCourse.find(params[:id])
    @ask_course.destroy
    respond_to do |format|
      format.html
      format.json { render json:
        {
          status: "Item was successfully destroyed.",
          course_comment: @ask_course
        }
      }
    end
  end

  private

  def ask_courses_params
    params.require(:ask_course).permit(:title ,:body ,:course_name ,:course_lecturer ,:course_organization_code ,:course_general_code ,:course_code, :user_id ,:anonymous)
  end
end
