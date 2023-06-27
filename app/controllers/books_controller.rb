class BooksController < ApplicationController
  def new
    @book = Book.new
  end
def edit
  user = User.find(params[:id])
  
  unless user.id == current_user.id
    redirect_to books_path
  end
  @book = Book.find(params[:id])
end

  def index
    
    @books = Book.all
    
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
     flash[:notice] = "successfully"
    redirect_to book_path(@book)
   else
     @books = Book.all
    render :index
   end
  end

    def update
        user = User.find(params[:id])
       
  unless user.id == current_user.id
    redirect_to books_path
  end
      
       @book = Book.find(params[:id])
    if @book.update(book_params)

      flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
    render :edit
    end
    end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  


  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
