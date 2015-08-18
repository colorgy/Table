class ChatGroupMembersController < ApplicationController
  def create
    @chat_group_member = ChatGroupMember.new(chat_group_members_params)

    respond_to do |format|
      if @chat_group_member.save
        format.json { render json:
          {
            chat_group_member: @chat_group_member
          }
        }
      else
        format.json {render json: { status: "failed" }}
      end
    end
  end

  def destroy
    @chat_group_member = ChatGroupMember.find(params[:id])
    @chat_group_member.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Item was successfully destroyed.",
          chat_group_member: @chat_group_member
        }
      }
    end
  end

  private

  def chat_group_members_params
    params.require(:chat_group_member).permit(:user_id,:chat_group_id)
  end
end
