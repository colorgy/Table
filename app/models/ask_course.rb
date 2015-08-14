class AskCourse < ActiveRecord::Base
  belongs_to :user
  validates :title ,:body ,:course_name ,:course_lecturer ,:course_organization_code ,:course_general_code ,:course_code ,:user_id ,:anonymous, presence: true
end
