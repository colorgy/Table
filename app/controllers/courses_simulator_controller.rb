class CoursesSimulatorController < ApplicationController
  def index
    if current_user.blank?
      flash[:error] = "請先登入才能進行此操作"
      redirect_to landing_page_path
    else
      if current_user.organization_code.blank? || current_user.organization_code == ''
        flash[:error] = "你沒有驗證學校 email，請至 https://colorgy.io/my-account/emails/new 進行驗證再回來～"
        redirect_to landing_page_path
      else
        @user_courses = current_user.user_courses
      end
    end
  end

  def create
    @courses_simulator_item = current_user.user_courses.new(courses_simulator_params)

    respond_to do |format|
      if @courses_simulator_item.save
        format.json { render json:
          {
            item: @courses_simulator_item
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @courses_simulator_item = current_user.user_courses.find(params[:id])
    @courses_simulator_item.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Item was successfully destroyed.",
          item: @courses_simulator_item
        }
      }
    end
  end

  private

  def courses_simulator_params
    params.require(:courses_simulator).permit(:course_code, :course_organization_code)
  end
end

