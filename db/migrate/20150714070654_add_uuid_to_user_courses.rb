class AddUuidToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :uuid, :string
    add_index :user_courses, :uuid, unique: true
  end
end
