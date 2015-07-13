class UserCourse < ActiveRecord::Base
  belongs_to :user

  validates :user, :course_code, presence: true
  validates :course_code, uniqueness: { scope: [:user_id, :course_organization_code] }
end
