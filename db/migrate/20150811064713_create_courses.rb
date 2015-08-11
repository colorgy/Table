class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :organization_code
      t.string :general_code
      t.text :scoring_method
      t.text :roll_call_frequency

      t.timestamps null: false
    end
  end
end
