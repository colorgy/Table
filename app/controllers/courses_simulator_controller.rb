class CoursesSimulatorController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses_simulator_items = current_user.courses_simulator_items
    @course = Course.all
  end

  def create
    @courses_simulator_item = current_user.courses_simulator_items.new(courses_simulator_params)

    respond_to do |format|
      if @courses_simulator_item.save
        # format.html { redirect_to :back, notice: 'Add to wish list successfully!' }
        format.json { render json:
          {
            item: @courses_simulator_item,
            course: @courses_simulator_item.course
          }
        }
      else
        # format.html { redirect_to :back, notice: 'Add to wish list failed!' }
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @courses_simulator_item = current_user.courses_simulator_items.find(params[:id])
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
    params.require(:courses_simulator).permit(:course_id)
  end
end

