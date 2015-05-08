class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.text :course_time
      t.text :course_code
      t.string :lecturer_name

      t.timestamps null: false
    end
  end
end
