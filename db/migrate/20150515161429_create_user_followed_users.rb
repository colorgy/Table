class CreateUserFollowedUsers < ActiveRecord::Migration
  def change
    create_table :user_followed_users do |t|
      t.integer :user_id
      t.integer :followed_user_id

      t.timestamps null: false
    end
    add_index :user_followed_users, :user_id
    add_index :user_followed_users, :followed_user_id
  end
end
