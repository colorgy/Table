class AddCoursesTableVisibilityForGuestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :courses_table_visibility_for_guests, :boolean, :default => true
  end
end
