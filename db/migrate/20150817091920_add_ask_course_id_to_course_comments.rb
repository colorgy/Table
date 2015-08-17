class AddAskCourseIdToCourseComments < ActiveRecord::Migration
  def change
    add_column :course_comments, :ask_course_id, :integer
  end
end
