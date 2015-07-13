class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.integer :user_id
      t.string :course_code
      t.string :course_organization_code
      t.integer :year
      t.integer :term

      t.timestamps null: false
    end
    add_index :user_courses, :user_id, unique: false
    add_index :user_courses, :year, unique: false
    add_index :user_courses, :term, unique: false
  end
end
