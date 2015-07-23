class CreateCourseComments < ActiveRecord::Migration
  def change
    create_table :course_comments do |t|
      t.string :course_general_code
      t.string :course_year
      t.string :course_term
      t.string :title
      t.text :body
      t.integer :rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
