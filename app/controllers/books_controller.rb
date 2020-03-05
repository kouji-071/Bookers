class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
  	redirect_to book_path(book.id), notice:"You have creatad book successfully."
  end
  end

  def show
    #@user = User.find(params[:id])
  	@mybook = Book.find(params[:id])
    @book = Book.new
    @user = @mybook.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id), notice:"You have updated book successfully."
  end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end