class ChatMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_group
end
