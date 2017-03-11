class ChatRoomsController < ApplicationController
  before_action :chat_room_users, only: [:show]
  before_action :set_chat, only: [:show]

  def index
    @chat_rooms = current_user.chat_rooms
  end

  def show
  end

  private

   def set_chat
     @chat_room = ChatRoom.find params[:id]
   end

  def chat_room_users
    unless ChatRoom.find(params[:id]).users.pluck(:id).include?(current_user.id)
      redirect_default
    end
  end

end
