class UsersController < ApplicationController

  before_action :unique_friend!, only: [ :add_friend ]
  before_action :cant_make_friend_myself!, only: [ :add_friend ]

  def home
  end

  def quit_friend
    current_user.quit_friend(params[:friend_id])
  end

  def search_friend
    render nothing: true
    key_word   = strip_with_full_size_space!(params[:q][:name_cont])
    @results   = User.where(email: key_word)
  end

  def add_friend
    render nothing: true
    user = User.find params[:friend_id]
    current_user.add_friend user
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
    binding.pry
    current_user
  end

  def cant_make_friend_myself!
    if current_user.id == params[:friend_id]
      redirect_back(fallback_location: root_path)
    end
  end


end
