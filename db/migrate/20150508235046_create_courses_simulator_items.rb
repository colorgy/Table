class CreateCoursesSimulatorItems < ActiveRecord::Migration
  def change
    create_table :courses_simulator_items do |t|
      t.integer :user_id
      t.string :course_code
      t.integer :year
      t.integer :term

      t.timestamps null: false
    end
    add_index :courses_simulator_items, :user_id, unique: false
  end
end
