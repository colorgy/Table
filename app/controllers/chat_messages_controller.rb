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

  def get_messages
    chat_group_id = params[:chat_group_id]
    @messages = ChatMessage.where(chat_group_id: chat_group_id)
    respond_to do |format|
      if @messages
        format.json { render json:
          {
            messages: @messages
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  private

  def chat_messages_params
    params.require(:chat_message).permit(:user_id,:message,:chat_group_id, :user_name, :user_avatar_url)
  end
end
