class AddFbVisibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_visibility, :boolean, :default => true
  end
end
