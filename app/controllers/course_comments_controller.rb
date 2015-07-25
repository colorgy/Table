class CourseCommentsController < ApplicationController


  def index
    @course_comments = CourseComment.all
  end

  def new
    @course_comment = CourseComment.new
  end

  def search
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      #keyword_year = "%" + params[:year] + "%"
      #keyword_term = "%" + params[:term] + "%"
      keyword_general_code = "%" + params[:course_general_code] + "%"
      #@course_comments = CourseComment.where("year LIKE ? OR term LIKE ? OR general_code LIKE ?", keyword_year, keyword_term, keyword_general_code)
      @course_comments = CourseComment.where("course_general_code LIKE ?", keyword_general_code)
      respond_to do |format|
      if @course_comments
        format.json { render json:
          {
            course_comments: @course_comments
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end
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
    params.require(:course_comment).permit(:course_general_code, :course_year, :course_term, :body, :rating, :user_id, :user_avatar_url, :user_name)
  end
end
