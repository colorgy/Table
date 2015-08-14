class CreateAskCourses < ActiveRecord::Migration
  def change
    create_table :ask_courses do |t|
      t.string :title
      t.text :body
      t.string :course_name
      t.string :course_lecturer
      t.string :course_organization_code
      t.string :course_general_code
      t.string :course_code
      t.integer :user_id
      t.boolean :anonymous

      t.timestamps null: false
    end
  end
end
