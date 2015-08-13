class CourseCommentsController < ApplicationController
  def index
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      current_user_organization_code = current_user.organization_code
      @course_comments = CourseComment.where(organization_code: current_user_organization_code ).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
      course_general_code = "%" + params[:course_general_code] + "%" if params[:course_general_code].present?
      course_name = "%" + params[:course_name] + "%" if params[:course_name].present?
      course_lecturer = "%" + params[:course_lecturer] + "%" if params[:course_lecturer].present?
      @course_comments = @course_comments.where("course_general_code LIKE ?", course_general_code).paginate(:page => params[:page], :per_page => 10) if params[:course_general_code].present? && params[:course_general_code] != '' && params[:course_general_code] != 'undefined'
      @course_comments = @course_comments.where("course_name LIKE ?", course_name).paginate(:page => params[:page], :per_page => 10) if params[:course_name].present? && params[:course_name] != '' && params[:course_name] != 'undefined'
      @course_comments = @course_comments.where("course_lecturer LIKE ?", course_lecturer).paginate(:page => params[:page], :per_page => 10) if params[:course_lecturer].present? && params[:course_lecturer] != '' && params[:course_lecturer] != 'undefined'
    end
  end

  def new
    @course_comment = CourseComment.new
  end

  def search
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      if params[:course_general_code]
        if params[:course_general_code] == ''
          @course_comments = CourseComment.where(organization_code: current_user.organization_code).order('created_at DESC')
        else
          keyword_general_code = "%" + params[:course_general_code] + "%"
          @course_comments = CourseComment.where("course_general_code LIKE ?", keyword_general_code).order('created_at DESC')
        end
      else
        if params[:course_name]
          if params[:course_name] == ''
            @course_comments = CourseComment.where(organization_code: current_user.organization_code).order('created_at DESC')
          else
            keyword_course_name = "%" + params[:course_name] + "%"
            @course_comments = CourseComment.where("course_name LIKE ?", keyword_course_name).order('created_at DESC')
          end
        else
          if params[:course_lecturer]
            if params[:course_lecturer] == ''
              @course_comments = CourseComment.where(organization_code: current_user.organization_code).order('created_at DESC')
            else
              keyword_course_lecturer = "%" + params[:course_lecturer] + "%"
              @course_comments = CourseComment.where("course_lecturer LIKE ?", keyword_course_lecturer).order('created_at DESC')
            end
          else
            flash[:error] = "搜尋條件錯誤"
            redirect_to course_comments_path
          end
        end
      end

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
    params.require(:course_comment).permit(:course_general_code, :course_year, :course_term, :body, :rating, :user_id, :user_avatar_url, :user_name, :organization_code, :course_lecturer, :course_name, :anonymous)
  end
end
