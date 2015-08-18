class ChatGroup < ActiveRecord::Base
  has_many :chat_group_members
end
