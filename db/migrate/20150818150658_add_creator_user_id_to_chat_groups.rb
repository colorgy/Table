class AddCreatorUserIdToChatGroups < ActiveRecord::Migration
  def change
    add_column :chat_groups, :creator_user_id, :integer
  end
end
