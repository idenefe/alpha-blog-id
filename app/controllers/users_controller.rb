class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show,:destroy] 
  def new
    @user=User.new
  end
  def create
    #debugger # will add breakpoint for byebug debugger
    @user = User.new(user_params)
    if @user.save #will cause error without redirect unless create view is defined
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
