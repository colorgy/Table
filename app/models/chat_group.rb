class ChatGroup < ActiveRecord::Base
  has_many :chat_group_members
  has_many :chat_messages
end
