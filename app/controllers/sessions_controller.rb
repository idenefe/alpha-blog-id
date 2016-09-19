class SessionsController < ApplicationController

  def new # display login page
      
  end
  
  def create #log in to session
    #debugger
    user = User.find_by(username: params[:session][:username])
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] ="Successful Login"
        redirect_to user_path(user)
      else
        flash.now[:warning] = "Incorrect Username/Password combination"
        render 'new'
      end
    else
      flash.now[:warning] = "No account with that username exists"
      render 'new'
    end
  end
  
  def destroy #log out from session
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end

  
end