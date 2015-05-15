class CoursesSimulatorItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :course

	validates :user, :course, presence: true
	validates :course_id, uniqueness: { scope: :user_id }
end
