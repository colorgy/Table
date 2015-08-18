class AddOtherLevelToCourseComments < ActiveRecord::Migration
  def change
    add_column :course_comments, :practicality_level, :integer
    add_column :course_comments, :sweet_level, :integer
    add_column :course_comments, :difficulty_level, :integer
  end
end
