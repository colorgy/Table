class PollsController < ApplicationController

  def index


  end

  def create
    @poll = current_user.polls.new(poll_params)
    respond_to do |format|
      if @poll.save
        format.json {
          render json:{
            poll: @poll
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def female_poll
    if current_user.blank?
      flash[:error] = "請先登入才能進行投票活動"
      redirect_to polls_path
    end
  end

  def male_poll
    if current_user.blank?
      flash[:error] = "請先登入才能進行投票活動"
      redirect_to polls_path
    end
  end

  def get_poll_result
    gender = params[:gender]
    @poll = Poll.all.where(user_polled_user_gender: gender)
    @poll_fresh = @poll.where(user_polled_user_started_year: 2015)
    @poll_total = @poll.count
    @poll_fresh_total = @poll_fresh.count

    respond_to do |format|
      if @poll_total && @poll_fresh_total
        format.json {
          render json:{
            poll_total: @poll_total,
            poll_fresh_total: @poll_fresh_total
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end

  end

  private

  def poll_params
    params.require(:poll).permit(:user_id,:user_polled_user_id,:user_polled_user_gender,:user_polled_user_started_year)
  end
end
