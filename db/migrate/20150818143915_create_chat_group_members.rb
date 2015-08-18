class CreateChatGroupMembers < ActiveRecord::Migration
  def change
    create_table :chat_group_members do |t|
      t.integer :chat_group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
