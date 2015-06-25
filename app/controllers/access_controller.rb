class AccessController < ApplicationController
  layout "login"

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def login
  end

  def index
  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
      found_player = Player.where(:email => params[:email]).first
      if found_player
        authorized_player = found_player.authenticate(params[:password])
      end

      if authorized_player
        session[:player_id] = authorized_player.id
        session[:player_email] = authorized_player.email

        flash[:success] = "You are now logged in"
        redirect_to(:controller => 'players', :action => 'show', :id => session[:player_id])
      else
        flash[:danger] = "Invalid email/password combination"
        redirect_to(:back)
      end
    else
      flash[:danger] = "Email and/or password cannot be blank"
      redirect_to(:back)
    end
  end

  def logout
    session[:player_id] = nil
    session[:player_email] = nil
  	flash[:success] = "You are now logged out"
    redirect_to(:back)
  end


end
