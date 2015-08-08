class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_login, :boolean, :default => true
    add_column :users, :shared, :boolean, :default => false
    add_column :users, :subscribed, :boolean, :default => false
  end
end
