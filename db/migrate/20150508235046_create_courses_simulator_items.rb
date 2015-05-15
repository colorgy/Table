class CreateCoursesSimulatorItems < ActiveRecord::Migration
  def change
    create_table :courses_simulator_items do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps null: false
    end
    add_index :courses_simulator_items, :user_id, unique: false
    add_index :courses_simulator_items, :course_id, unique: false
  end
end
