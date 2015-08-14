class CourseComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask_course

  validates :course_general_code, :course_year, :course_term, :body, :rating, :user_id, :user_avatar_url, :user_name, :organization_code,:course_lecturer, :course_name, presence: true
end
