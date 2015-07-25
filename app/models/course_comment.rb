class CourseComment < ActiveRecord::Base
  belongs_to :user
  validates :course_general_code, :course_year, :course_term, :body, :rating, :user_id, :user_avatar_url, :user_name, presence: true
end