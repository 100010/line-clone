class UsersController < ApplicationController

  def home
  end

  def quit_friend
    binding.pry
    current_user.quit_friend(params[:friend_id])
  end

end
