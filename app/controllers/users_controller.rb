class UsersController < ApplicationController
  
  
def show
  @user = User.find(params[:id])
  @books = @user.books
   @book = Book.find(params[:id])
end

def create
  @user = User.new(user_params)
  @user.user_id =current_user.id
  if @user.save
    redirect_to user_path
  else
    render :edit
  end
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
    redirect_to user_path(@user.id)
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end


end