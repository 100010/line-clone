class UsersController < ApplicationController

  def home
  end

  def quit_friend
    current_user.quit_friend(params[:friend_id])
  end

end
