class AskCourse < ActiveRecord::Base
  belongs_to :user
  has_many :course_comments
  validates :title ,:body ,:course_name ,:course_lecturer ,:course_organization_code ,:course_general_code ,:course_code ,:user_id , presence: true
  validates :anonymous, :inclusion => {:in => [true, false]}
end
