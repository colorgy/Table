class AddColumnsToCourseComments < ActiveRecord::Migration
  def change
    add_column :course_comments, :course_lecturer, :string
    add_column :course_comments, :course_name, :string
  end
end
