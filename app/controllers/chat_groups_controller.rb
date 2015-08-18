class ChatGroupsController < ApplicationController
  def index
    @chat_groups = ChatGroup.all
  end

  def show
    @chat_group = ChatGroup.find(params[:id])
    @chat_group_members = @chat_group.chat_group_members
    @chat_messages = @chat_group.chat_messages
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_groups_params)

    if @chat_group.save
      redirect_to chat_group_path(@chat_group)
    else
      render 'new'
    end

  end

  def destroy
    @chat_group = ChatGroup.find(params[:id])
    @chat_group.destroy
    respond_to do |format|
      format.html
      format.json { render json:
        {
          status: "Item was successfully destroyed.",
          chat_group: @chat_group
        }
      }
    end
  end

  private

  def chat_groups_params
    params.require(:chat_group).permit(:name, :organization_code, :course_code, :creator_user_id)
  end
end
