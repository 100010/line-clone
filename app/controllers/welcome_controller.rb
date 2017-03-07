class WelcomeController < ApplicationController

  before_action :autheticated_user

  layout 'empty'

  def index
  end

  private def autheticated_user
    if current_user
      redirect_to home_user_path(current_user)
    end
  end
end
