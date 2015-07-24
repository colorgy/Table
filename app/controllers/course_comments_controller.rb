class CourseCommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @course_comments = CourseComment.all
  end

  def new
    @course_comment = CourseComment.new
  end

  def create
    @course_comment = CourseComment.new(course_comments_params)

    respond_to do |format|
      if @course_comment.save
        format.json { render json:
          {
            course_comment: @course_comment
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @course_comment = CourseComment.find(params[:id])
    @course_comment.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Item was successfully destroyed.",
          course_comment: @course_comment
        }
      }
    end
  end

  private

  def course_comments_params
    params.require(:course_comment).permit(:course_general_code, :course_year, :course_term, :title, :body, :rating, :user_id)
  end
end
