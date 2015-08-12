class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def course
    if params[:general_code].present? && params[:general_code] != '' && params[:general_code] != 'undefined'
      current_user_organization_code = current_user.organization_code
      course_general_code = params[:general_code] if params[:general_code].present?
      @course_comments = CourseComment.where(organization_code: current_user_organization_code ).order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
      @course_comments = @course_comments.where("course_general_code LIKE ?", course_general_code).paginate(:page => params[:page], :per_page => 3)
    else
      redirect_to root_path
    end
  end
end
