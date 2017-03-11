class MessagesController < ApplicationController

  def create
    Message.create(
      user_id: params[:message][:user_id],
      chat_room_id: params[:message][:chat_room_id],
      content: params[:message][:content],
    )

    ChatRoom.find(params[:message][:chat_room_id]).update(last_communicated_at: Time.zone.now)
    redirect_default
  end

end
