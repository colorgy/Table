class UserCourse < ActiveRecord::Base
  belongs_to :user

  validates :user, :course_code, :year, :term, presence: true
  validates :course_code, uniqueness: { scope: [:user_id, :course_organization_code] }

  before_validation :init_uuid, :init_semester, on: :create

  private

  def init_uuid
    self.uuid = SecureRandom.uuid if self.uuid.blank?
  end

  def init_semester
    return if (self.year && self.term)

    self.year = DateService.current_year
    self.term = DateService.current_term
  end
end
