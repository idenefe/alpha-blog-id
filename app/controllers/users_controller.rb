class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_action :set_user, only: [:edit,:update,:show,:destroy] 
  def new
    @user=User.new
  end
  def create
    #render plain: params[:user].inspect #this will display a hash representation of the passed data
    #must whitelist incoming data 
    #debugger # will add breakpoint for byebug debugger
    @user = User.new(user_params) # calls the private article_params white-listing function
    if @user.save #will cause error without redirect
      flash[:success] ="User was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:username,:email,:password) 
    end
    def set_user
      @user = User.find(params[:id])
    end
end
