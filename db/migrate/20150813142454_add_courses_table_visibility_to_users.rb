class AddCoursesTableVisibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :courses_table_visibility, :boolean, :default => true
  end
end
