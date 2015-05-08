class Course < ActiveRecord::Base
	validates :course_name, presence: true
	validates :course_time, presence: true
	validates :course_code, presence: true
	validates :lecturer_name, presence: true
end
