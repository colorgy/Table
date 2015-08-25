class AddGetPolledAndPollAnonymousToUsers < ActiveRecord::Migration
  def change
    add_column :users, :get_polled, :integer, :default => 0, :null => false
    add_column :users, :poll_anonymous, :boolean, :default => false
  end
end
