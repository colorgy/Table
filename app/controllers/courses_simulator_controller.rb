class CoursesSimulatorController < ApplicationController
  def index
    if current_user.blank?
      redirect_to ask_login_path
    else
      @user_courses = current_user.user_courses
    end
  end

  def create
    @courses_simulator_item = current_user.user_courses.new(courses_simulator_params)

    respond_to do |format|
      if @courses_simulator_item.save
        # format.html { redirect_to :back, notice: 'Add to wish list successfully!' }
        format.json { render json:
          {
            item: @courses_simulator_item
          }
        }
      else
        # format.html { redirect_to :back, notice: 'Add to wish list failed!' }
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @courses_simulator_item = current_user.user_courses.find(params[:id])
    @courses_simulator_item.destroy
    respond_to do |format|
      # format.html { redirect_to :back, notice: 'Item was successfully destroyed.' }
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

