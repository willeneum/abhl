class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



private
  def confirm_logged_in
    unless session[:player_id]
      flash[:warning] = "Please log in"
      redirect_to(:back)
      return false
    else
      return true
    end
  end

  def confirm_admin
    if session[:player_id] && Player.find(session[:player_id]).admin
      return true
    else
      flash[:danger] = "You do not have admin priviledges for that request"
      redirect_to(:back)
      return false
    end
  end
end
