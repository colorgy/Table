class AddStudentsCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :students_count, :integer, null: false, default: 0
  end
end
