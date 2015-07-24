class CourseComment < ActiveRecord::Base
  belongs_to :user
  validates :course_general_code, :course_year, :course_term, :title, :body, :rating, :user_id, presence: true
end
