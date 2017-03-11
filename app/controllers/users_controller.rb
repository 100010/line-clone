class UsersController < ApplicationController

  before_action :unique_friend!, only: [ :add_friend ]
  before_action :cant_make_friend_myself!, only: [ :add_friend ]

  def home
  end

  def quit_friend
    current_user.quit_friend(params[:friend_id])
  end

  def add_friends
    @results = User.where(email: params[:email])
  end

  def start_talk
    name = "#{current_user.name} と#{params[:friend_name]}のトーク"
    new_chat_room = ChatRoom.create(name: name)
    new_chat_room.join(current_user.id)
    new_chat_room.join(params[:friend_id])
    redirect_to chat_room_path(new_chat_room)
  end

  def add_friend
    user = User.find params[:friend_id]
    current_user.add_friend user
    redirect_default
  end

  private

  def permit_params
    params.
      require(:user).
        permit(
          :name,
          :image,
        )
  end

  def strip_with_full_size_space!(str)
    s = "　\s\v"
    str.sub!(/^[#{s}]*([^#{s}]+)[#{s}]*$/o, '\1')
  end



  def unique_friend!
    current_user
  end

  def cant_make_friend_myself!
    if current_user.id == params[:friend_id]
      redirect_back(fallback_location: root_path)
    end
  end


end
