class UserCourse < ActiveRecord::Base
  belongs_to :user

  validates :user, :course_code, presence: true
  validates :course_code, uniqueness: { scope: [:user_id, :course_organization_code] }

  before_validation :init_uuid, on: :create

  private

  def init_uuid
    self.uuid = SecureRandom.uuid if self.uuid.blank?
  end
end
