class HomesController < ApplicationController
  def top
  end
  
  def about
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

    def update
       @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book.id)
    end
end
