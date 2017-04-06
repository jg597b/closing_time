class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

   def index
       @users = User.all
   end

  def show
  end

  def new
    @user = User.new
  end
  
 def create
    @user = User.new(user_params)
    #use parentesis for readability
    @user.save ? (redirect_to users_path) : (redirect_to new_user_path)
  end

  def edit
  end

  def update 
    @user.update(user_params) ? (redirect_to users_path) : (redirect_to edit_user_path(user))     
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  private
  def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end



end
