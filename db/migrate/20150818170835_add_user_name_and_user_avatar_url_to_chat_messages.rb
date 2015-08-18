class AddUserNameAndUserAvatarUrlToChatMessages < ActiveRecord::Migration
  def change
    add_column :chat_messages, :user_name, :string
    add_column :chat_messages, :user_avatar_url, :string
  end
end
