class AskCoursesController < ApplicationController
  def index
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      @ask_courses = AskCourse.where(course_organization_code: current_user.organization_code).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
      course_general_code = "%" + params[:course_general_code] + "%" if params[:course_general_code].present?
      course_name = "%" + params[:course_name] + "%" if params[:course_name].present?
      course_lecturer = "%" + params[:course_lecturer] + "%" if params[:course_lecturer].present?
      @ask_courses = @ask_courses.where("course_general_code LIKE ?", course_general_code).paginate(:page => params[:page], :per_page => 10) if params[:course_general_code].present? && params[:course_general_code] != '' && params[:course_general_code] != 'undefined'
      @ask_courses = @ask_courses.where("course_name LIKE ?", course_name).paginate(:page => params[:page], :per_page => 10) if params[:course_name].present? && params[:course_name] != '' && params[:course_name] != 'undefined'
      @ask_courses = @ask_courses.where("course_lecturer LIKE ?", course_lecturer).paginate(:page => params[:page], :per_page => 10) if params[:course_lecturer].present? && params[:course_lecturer] != '' && params[:course_lecturer] != 'undefined'
    end
  end

  def show
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      @ask_course = AskCourse.find(params[:id])
      @user = User.find(@ask_course.user_id)
      @course_comments = CourseComment.where(ask_course_id: @ask_course.id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      @ask_course = AskCourse.new
    end
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
