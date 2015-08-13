class AddAnonymousToCourseComments < ActiveRecord::Migration
  def change
    add_column :course_comments, :anonymous, :boolean, :default => false
  end
end
