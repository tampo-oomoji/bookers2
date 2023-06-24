class UsersController < ApplicationController
  
  
def show
  @user = User.find(params[:id])
end

def create
  @user = User.new(user_params)
  @user.user_id =current_user.id
  @user.save
  redirect_to user_path
end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def index
    @users = User.all
  
     @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to homes_top_path
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end


end