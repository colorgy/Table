class AddGeneralCodeToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :course_general_code, :string
  end
end
