class PagesController < ApplicationController
  def index
  end

  def ask_login
  end

  def user_has_courses_count
    @users = User.all
  end
end
