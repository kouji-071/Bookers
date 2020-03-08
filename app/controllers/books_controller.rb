class BooksController < ApplicationController

  before_action :authenticate_user!


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      redirect_to book_path(@book.id), notice:"You have creatad book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
    # @user = @mybook.user
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:"You have updated book successfully."
    else

      render :edit
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
