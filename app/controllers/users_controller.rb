class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update]
  before_action :check_user, only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "edited your profile!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :profile, :location)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def check_user
      if current_user != @user
        redirect_to root_url
      end
    end
end

