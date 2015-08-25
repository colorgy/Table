class ChangePollAnonymousToUsers < ActiveRecord::Migration
  def change
    change_column :users, :poll_anonymous, :boolean, :default => false
  end
end
