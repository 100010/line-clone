class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_default
    redirect_back(fallback_location: root_path)
  end
end
