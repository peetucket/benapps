class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def post_only
    redirect_to root_path unless request.post?
  end

end
