class AskCoursesController < ApplicationController
  def index
    @ask_courses = AskCourse.all
  end

  def show
    @ask_course = AskCourse.find(params[:id])
  end

  def create
    @ask_course = AskCourse.new(course_comments_params)

    respond_to do |format|
      if @ask_course.save
        format.json { render json:
          {
            course_comment: @ask_course
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @ask_course = AskCourse.find(params[:id])
    @ask_course.destroy
    respond_to do |format|
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
    params.require(:ask_course).permit(:title ,:body ,:course_name ,:course_lecturer ,:course_organization_code ,:course_general_code ,:course_code ,:user_id ,:anonymous)
  end
end
