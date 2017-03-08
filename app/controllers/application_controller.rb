class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def is_number?(string)
    true if Float(string) rescue false
  end

end
