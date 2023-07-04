class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # @book = Book.find(@user.id)
    @newbook = Book.new
  end

  #def create
  #  @user = User.new(user_params)
  #  @book = Book.new(book_params)
  #  @book.user_id = current_user.id
  #  @book.save
  #end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
       @user = User.find(params[:id])
    # @user.user_id =current_user.id

  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
    redirect_to user_path(@user.id)

    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile)
  end


end