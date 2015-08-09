class CreateCourseComments < ActiveRecord::Migration
  def change
    create_table :course_comments do |t|
      t.string :course_general_code
      t.string :course_year, :default => '2015'
      t.string :course_term, :default => '1'
      t.string :user_avatar_url
      t.string :user_name
      t.text :body
      t.integer :rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
