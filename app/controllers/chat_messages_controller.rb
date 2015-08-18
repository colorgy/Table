class ChatMessagesController < ApplicationController

  def create
    @chat_message = ChatMessage.new(chat_messages_params)

    respond_to do |format|
      if @chat_message.save
        format.json { render json:
          {
            chat_message: @chat_message
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  private

  def chat_messages_params
    params.require(:chat_message).permit(:user_id,:message,:chat_group_id)
  end
end
