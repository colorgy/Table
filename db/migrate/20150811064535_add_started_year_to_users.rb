class AddStartedYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :started_year, :integer
  end
end
